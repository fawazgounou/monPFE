import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insertion_bd/screens/VehiculA/SignatureA/preview_signature.dart';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/transitionA.dart';
import 'package:signature/signature.dart';

class SignaturePageA extends StatefulWidget {
  const SignaturePageA({Key? key}) : super(key: key);

  @override
  _SignaturePageAState createState() => _SignaturePageAState();
}

class _SignaturePageAState extends State<SignaturePageA> {
  late SignatureController controller;

  @override
  void initState() {
    super.initState();

    controller = SignatureController(
      penStrokeWidth: 4,
      penColor: Colors.white,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Signature Conducteur A",
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 550,
              width: 400,
              child: Signature(
                controller: controller,
                backgroundColor: Colors.black,
              ),
            ),
            buildButtons(context),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
               /*   FirebaseFirestore.instance.collection('ConducteurA').add({
                      'signature': degatsapparentA.value,
                     
                    }); */
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TransitionA()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                shadowColor: Colors.white.withOpacity(.7),
              ),
              child: const Text(
                "Suivant",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
        /*   bottomNavigationBar: GestureDetector(
        onTap: () {
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TransitionA(
               
              ),
            ),
          );
        },
        child: Container(
          height: 70.0,
          width: double.infinity,
          color: Colors.blueAccent,
          child: const Text(
            "Suivant",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
            ),
          ),
          alignment: Alignment.center,
        ),
      ), */
      );

  Widget buildButtons(BuildContext context) => Container(
        color: Colors.black,
        child: Center(
          child: Row(
            children: <Widget>[
              buildCheck(context),
              const SizedBox(
                width: 220,
              ),
              buildClear(),
            ],
          ),
        ),
      );

  Widget buildCheck(BuildContext context) => IconButton(
        iconSize: 36,
        icon: const Icon(Icons.check, color: Colors.green),
        onPressed: () async {
          if (controller.isNotEmpty) {
            final signature = await exportSignature();

            await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SignaturePreviewPage(signature: signature!),
            ));

            controller.clear();
          }
        },
      );

  Widget buildClear() => IconButton(
        iconSize: 36,
        icon: const Icon(Icons.clear, color: Colors.red),
        onPressed: () => controller.clear(),
      );

  Future<Uint8List?> exportSignature() async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
      points: controller.points,
    );

    final signature = await exportController.toPngBytes();
    exportController.dispose();

    return signature;
  }
}
