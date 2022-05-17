import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/Model/model.dart';
import 'package:insertion_bd/screens/1_VehiculA/addphotoA1.dart';
import 'package:insertion_bd/screens/VehiculA/addphotoA.dart';
import 'package:insertion_bd/screens/VehiculA/transitionA.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/customTextField.dart';

class AddObservationA1 extends StatefulWidget {
  var Sin;
  var Temoin;
  var blesse;
  var vehiculeA;
  var assureA;
  var assuranceA;
  var conductA;
  AddObservationA1(
      {Key? key,
      this.Sin,
      this.Temoin,
      this.blesse,
      this.vehiculeA,
      this.assureA,
      this.assuranceA,
      this.conductA})
      : super(key: key);

  @override
  State<AddObservationA1> createState() => _AddObservationA1State();
}

class _AddObservationA1State extends State<AddObservationA1> {
   var uuid = Uuid();
  var observ = [];
  CustomTextField degatsapparentA = CustomTextField(
      placeholder: "Dégats",
      title: "Dégats Apparents",
      line: 3,
      initialValue: '');
  CustomTextField observationA = CustomTextField(
      placeholder: "Donnés vos observations",
      title: "Observation A",
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
          "Informations Observation A",
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
            observ = [uuid.v1(),degatsapparentA.value, observationA.value];

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => AddPhotoA1(
                   Sin: widget.Sin,
                          Temoin: widget.Temoin,
                          blesse: widget.blesse,
                          vehiculeA: widget.vehiculeA,
                          assureA: widget.assureA,
                          assuranceA: widget.assuranceA,
                          conductA: widget.conductA,
                          observ:observ,
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
