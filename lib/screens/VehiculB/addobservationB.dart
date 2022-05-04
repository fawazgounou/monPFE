import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/transitionA.dart';
import 'package:insertion_bd/screens/VehiculB/addphotoB.dart';

import '../../widgets/customTextField.dart';

class AddObservationB extends StatefulWidget {
  AddObservationB({Key? key}) : super(key: key);

  @override
  State<AddObservationB> createState() => _AddObservationBState();
}

class _AddObservationBState extends State<AddObservationB> {
  CustomTextField degatsapparentB = CustomTextField(
      placeholder: "Dégats",
      title: "Dégats Apparents",
      line: 3,
      initialValue: '');
  CustomTextField observationB = CustomTextField(
      placeholder: "Donnés vos observations",
      title: "Observation A",
      line: 5,
      initialValue: '');

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
      degatsapparentB.err = "veillez entrer les dégats Apparent ";
    observationB.err = "veillez entrer vos Observations";
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
                degatsapparentB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                observationB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                   FirebaseFirestore.instance.collection('ObservationB').add({
                      'date_sinistre': degatsapparentB.value,
                      'heure_sinistre': observationB.value,
                    });
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddPhotoB()));
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
