import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:insertion_bd/screens/VehiculA/SignatureA/utils.dart';
import 'package:permission_handler/permission_handler.dart';

class CroquisABPreviewPage extends StatelessWidget {
  final Uint8List signature;
  const CroquisABPreviewPage({Key? key, required this.signature})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text('Stockage Signature'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => storeSignature(context),
            icon: const Icon(Icons.done),
          )
        ],
      ),
      body: Center(
        child: Image.memory(
          signature,
          width: double.infinity,
        ),
      ),
    );
  }

  Future storeSignature(BuildContext context) async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    final time = DateTime.now().toIso8601String().replaceAll('.', ':');
    final name = 'signature_$time.png';

    final result = await ImageGallerySaver.saveImage(signature, name: name);
    final isSuccess = result['isSuccess'];

    if (isSuccess) {
      Navigator.pop(context);
      Utils.showSnackBar(
        context,
        text: 'Saved to croquis folder',
        color: Colors.green,
      );
    } else {
      Utils.showSnackBar(
        context,
        text: 'Failed to save croquis',
        color: Colors.red,
      );
    }
  }
}
