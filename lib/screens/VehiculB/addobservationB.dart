import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/1_VehiculeA/addphotoA1.dart';
import 'package:insertion_bd/screens/VehiculA/addphotoA.dart';
import 'package:insertion_bd/screens/VehiculA/transitionA.dart';
import 'package:insertion_bd/screens/VehiculB/addphotoB.dart';

import '../../widgets/customTextField.dart';

class AddObservationB extends StatefulWidget {
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
  var signature;
  var imagesignature;
  var transA;
  var vehiculeB;
  var assureB;
  var assuranceB;
  var conducteurB;
  AddObservationB(
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
      this.circonstanceA,
      this.signature,
      this.imagesignature,
      this.transA,
      this.vehiculeB,
      this.assureB,
      this.assuranceB,
      this.conducteurB})
      : super(key: key);
  @override
  State<AddObservationB> createState() => _AddObservationBState();
}

class _AddObservationBState extends State<AddObservationB> {
  var observB = [];
  CustomTextField degatsapparentA = CustomTextField(
      placeholder: "Dégats",
      title: "Dégats Apparents",
      line: 3,
      initialValue: '');
  CustomTextField observationA = CustomTextField(
      placeholder: "Donnés vos observations",
      title: "Observation B",
      line: 7,
      initialValue: '');

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    degatsapparentA.err = "Entrer les dégats Apparent ";
    observationA.err = "Entrer vos Observations";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informations Observation B",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _key,
            child: Column(
              children: [
                degatsapparentA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                observationA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (_key.currentState!.validate()) {
            observB = [
              degatsapparentA.value,
              observationA.value,
            ];
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddPhotoB(
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
                          signature: widget.signature,
                          imagesignature: widget.imagesignature,
                          transA: widget.transA,
                          vehiculeB: widget.vehiculeB,
                          assureB: widget.assureB,
                          assuranceB: widget.assuranceB,
                          conducteurB: widget.conducteurB,
                          observB: observB,
                        )));
          }
        },
        child: Container(
          height: 50.0,
          width: double.infinity,
          color: Colors.blue,
          child: const Text(
            "Suivant",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
