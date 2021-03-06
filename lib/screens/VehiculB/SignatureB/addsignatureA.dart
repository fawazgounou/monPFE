import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insertion_bd/screens/VehiculA/SignatureA/preview_signature.dart';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/transitionA.dart';
import 'package:signature/signature.dart';
import 'package:uuid/uuid.dart';

import 'addimgasignature.dart';

class SignaturePageB extends StatefulWidget {
  var Sin;
  var Temoin;
  var blesse;
  var vehiculeA;
  var assureA;
  var assuranceA;
  var conductA;
  var observ;
  var photo;

  var circonstanceA;
  var signature;
  var imagesignature;
  var transA;
  var vehiculeB;
  var assureB;
  var assuranceB;
  var conducteurB;
  var observB;
  var photoB;

  var circonstanceB;

  SignaturePageB(
      {Key? key,
      this.Sin,
      this.Temoin,
      this.blesse,
      this.vehiculeA,
      this.assureA,
      this.assuranceA,
      this.conductA,
      this.observ,
      this.photo,
      this.circonstanceA,
      this.signature,
      this.imagesignature,
      this.transA,
      this.vehiculeB,
      this.assureB,
      this.assuranceB,
      this.conducteurB,
      this.observB,
      this.photoB,
      this.circonstanceB})
      : super(key: key);

  @override
  _SignaturePageBState createState() => _SignaturePageBState();
}

class _SignaturePageBState extends State<SignaturePageB> {
  var uuid = Uuid();
  var signatureB = [];
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
            "Signature Conducteur B",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: 551.7,
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
          ],
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            signatureB = [uuid.v1()];
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddImageSignatureB(
                        Sin: widget.Sin,
                        Temoin: widget.Temoin,
                        blesse: widget.blesse,
                        vehiculeA: widget.vehiculeA,
                        assureA: widget.assureA,
                        assuranceA: widget.assuranceA,
                        conductA: widget.conductA,
                        observ: widget.observ,
                        photo: widget.photo,
                        circonstanceA: widget.circonstanceA,
                        signature: widget.signature,
                        imagesignature: widget.imagesignature,
                        transA: widget.transA,
                        vehiculeB: widget.vehiculeB,
                        assureB: widget.assureB,
                        assuranceB: widget.assuranceB,
                        conducteurB: widget.conducteurB,
                        observB: widget.observB,
                        photoB: widget.photoB,
                        circonstanceB: widget.circonstanceB,
                        signatureB: signatureB)));
          },
          child: Container(
            height: 50.0,
            width: double.infinity,
            color: Colors.blue,
            child: const Text(
              "Importer la signature",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.center,
          ),
        ),
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
