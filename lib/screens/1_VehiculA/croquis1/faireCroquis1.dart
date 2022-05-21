import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insertion_bd/Model/model.dart';
import 'package:insertion_bd/screens/1_VehiculA/SignatureA1/addimgasignature1.dart';
import 'package:insertion_bd/screens/1_VehiculA/croquis1/addCroquis1.dart';
import 'package:insertion_bd/screens/1_VehiculA/croquis1/preview_signature.dart';
import 'package:insertion_bd/screens/VehiculA/SignatureA/preview_signature.dart';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/transitionA.dart';
import 'package:signature/signature.dart';
import 'package:uuid/uuid.dart';

class FaireCroquis1 extends StatefulWidget {
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
  var circonstanceA;
  FaireCroquis1(
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
      this.arriere,
      this.avant,
      this.droit,
      this.gauche,
      this.hautA,
      this.circonstanceA})
      : super(key: key);
  @override
  _FaireCroquis1State createState() => _FaireCroquis1State();
}

class _FaireCroquis1State extends State<FaireCroquis1> {
  var uuid = const Uuid();
  var croquis = [];

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
            "Faire un croquis",
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
                backgroundColor: Colors.red,
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
            croquis = [uuid.v1()];
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddCroquis1(
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
                        croquis: croquis)));
          },
          child: Container(
            height: 50.0,
            width: double.infinity,
            color: Colors.blue,
            child: const Text(
              "Importer le croquis",
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
              builder: (context) => CroquisPreviewPage(signature: signature!),
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
