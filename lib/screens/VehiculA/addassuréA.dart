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
    nomassureA.err = "Entrer le Nom ";
    prenomassureA.err = "Entrer le Prénom";
    adresseassureA.err = "Entrer l'Adresse'";
    codepostalA.err = "Entrer le Code Poastal";
    telephoneassureA.err = "Entrer le Téléphone";
    emailA.err = "Entrer le Mail";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informaions Assuré A"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _key,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: nomassureA.textfrofield(),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: prenomassureA.textfrofield(),
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                adresseassureA.textfrofield(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: codepostalA.textfrofield(),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: telephoneassureA.textfrofield(),
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                emailA.textfrofield(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if(_key.currentState!.validate()){
FirebaseFirestore.instance.collection('AssureA').add({
            'nom': nomassureA.value,
            'prenom': prenomassureA.value,
            'adress': adresseassureA.value,
            'code_postal': codepostalA.value,
            'telephone': telephoneassureA.value,
            'email': emailA.value,
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddAssuranceA()));
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
