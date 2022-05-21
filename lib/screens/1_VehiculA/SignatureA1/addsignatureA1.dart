import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insertion_bd/Model/model.dart';
import 'package:insertion_bd/screens/1_VehiculA/SignatureA1/addimgasignature1.dart';
import 'package:insertion_bd/screens/VehiculA/SignatureA/preview_signature.dart';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/transitionA.dart';
import 'package:signature/signature.dart';
import 'package:uuid/uuid.dart';

class SignaturePageA1 extends StatefulWidget {
  var Sin;
  var Temoin;
  var blesse;
  var vehiculeA;
  var assureA;
  var assuranceA;
  var conductA;
  var observ;
  var photo;
  var arriere;
  var avant;
  var droit;
  var gauche;
  var hautA;
  var croquis;
  var imagecroquis;
  var circonstanceA;

  SignaturePageA1({
    Key? key,
    this.Sin,
    this.Temoin,
    this.blesse,
    this.vehiculeA,
    this.assureA,
    this.assuranceA,
    this.conductA,
    this.observ,
    this.photo,
    this.arriere,
    this.avant,
    this.droit,
    this.gauche,
    this.hautA,
    this.circonstanceA,
    this.croquis,
    this.imagecroquis,
  }) : super(key: key);

  @override
  _SignaturePageA1State createState() => _SignaturePageA1State();
}

class _SignaturePageA1State extends State<SignaturePageA1> {
  var uuid = Uuid();
  var signature = [];

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
            signature = [uuid.v1()];
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddImageSignatureA1(
                        Sin: widget.Sin,
                        Temoin: widget.Temoin,
                        blesse: widget.blesse,
                        vehiculeA: widget.vehiculeA,
                        assureA: widget.assureA,
                        assuranceA: widget.assuranceA,
                        conductA: widget.conductA,
                        observ: widget.observ,
                        photo: widget.photo,
                        arriere: widget.arriere,
                        avant: widget.avant,
                        droit: widget.droit,
                        gauche: widget.gauche,
                        hautA: widget.hautA,
                        circonstanceA: widget.circonstanceA,
                        croquis: widget.croquis,
                        imagecroquis: widget.imagecroquis,
                        signature: signature)));
          },
          child: Container(
            height: 50.0,
            width: double.infinity,
            color: Colors.blue,
            child: const Text(
              "Importer l'image",
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
