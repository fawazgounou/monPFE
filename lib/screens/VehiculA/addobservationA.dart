import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addphotoA.dart';
import 'package:insertion_bd/screens/VehiculA/transitionA.dart';

import '../../widgets/customTextField.dart';

class AddObservationA extends StatefulWidget {
  AddObservationA({Key? key}) : super(key: key);

  @override
  State<AddObservationA> createState() => _AddObservationAState();
}

class _AddObservationAState extends State<AddObservationA> {
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
    degatsapparentA.err = "Veuillez entrer les dégats Apparent ";
    observationA.err = "Veuillez entrer vos Observations";

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
          if(_key.currentState!.validate()){
 FirebaseFirestore.instance.collection('ObservationA').add({
            'date_sinistre': degatsapparentA.value,
            'heure_sinistre': observationA.value,
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddPhotoA()));
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
