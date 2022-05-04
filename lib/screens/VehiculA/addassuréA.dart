import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addassuranceA.dart';
import 'package:insertion_bd/screens/VehiculA/addconducteurA.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';

import '../../widgets/customTextField.dart';

class AddAssureA extends StatefulWidget {
  AddAssureA({Key? key}) : super(key: key);

  @override
  State<AddAssureA> createState() => _AddAssureAState();
}

class _AddAssureAState extends State<AddAssureA> {
  CustomTextField nomassureA = CustomTextField(
      placeholder: "Entrer le Nom", title: "Nom Assuré", initialValue: '');
  CustomTextField prenomassureA = CustomTextField(
      placeholder: "Entrer le Prenom",
      title: "Prénom Assuré",
      initialValue: '');
  CustomTextField adresseassureA = CustomTextField(
      placeholder: "Entrer l' Adresse",
      title: "Adresse Assuré",
      initialValue: '');
  CustomNumberField codepostalA = CustomNumberField(
      placeholder: "Entrer le Code Postal",
      title: "Code Postal",
      initialValue: '');
  CustomNumberField telephoneassureA = CustomNumberField(
      placeholder: "Entrer le Téléphone",
      title: "Téléphon Assuré",
      initialValue: '');
  CustomTextField emailA = CustomTextField(
      placeholder: "Entrer le mail", title: "Email Assuré", initialValue: '');

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    nomassureA.err = "veillez entrer le Nom ";
    prenomassureA.err = "veillez entrer le Prénom";
    adresseassureA.err = "veillez entrer l'Adresse'";
    codepostalA.err = "veillez entrer le Code Poastal";
    telephoneassureA.err = "veillez entrer le Téléphone";
    emailA.err = "veillez entrer le Mail";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informaions Assuré A"),
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
                  " Assuré A",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                nomassureA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                prenomassureA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                adresseassureA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                codepostalA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                telephoneassureA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                emailA.textfrofield(),
                const SizedBox(
                  height: 55,
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('AssureA').add({
                      'nom': nomassureA.value,
                      'prenom': prenomassureA.value,
                      'adress': adresseassureA.value,
                      'code_postal': codepostalA.value,
                      'telephone': telephoneassureA.value,
                      'email': emailA.value,
                    });

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddAssuranceA()));
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
