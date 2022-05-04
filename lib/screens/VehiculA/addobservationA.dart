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
      line: 5,
      initialValue: '');

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    degatsapparentA.err = "veillez entrer les dégats Apparent ";
    observationA.err = "veillez entrer vos Observations";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Information Observation A",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _key,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  " Observations A",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
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
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('ObservationA').add({
                      'date_sinistre': degatsapparentA.value,
                      'heure_sinistre': observationA.value,
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddPhotoA()));
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
          ),
        ),
      ),
    );
  }
}
