import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addassuranceA.dart';
import 'package:insertion_bd/screens/VehiculA/addconducteurA.dart';
import 'package:insertion_bd/screens/VehiculB/addassuranceB.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';

import '../../widgets/customTextField.dart';

class AddAssureB extends StatefulWidget {
  AddAssureB({Key? key}) : super(key: key);

  @override
  State<AddAssureB> createState() => _AddAssureBState();
}

class _AddAssureBState extends State<AddAssureB> {
  CustomTextField nomassureB = CustomTextField(
      placeholder: "Entrer le Nom", title: "Nom Assuré", initialValue: '');
  CustomTextField prenomassureB = CustomTextField(
      placeholder: "Entrer le Prenom",
      title: "Prénom Assuré",
      initialValue: '');
  CustomTextField adresseassureB = CustomTextField(
      placeholder: "Entrer l' Adresse",
      title: "Adresse Assuré",
      initialValue: '');
  CustomNumberField codepostalB = CustomNumberField(
      placeholder: "Entrer le Code Postal",
      title: "Code Postal",
      initialValue: '');
  CustomNumberField telephoneassureB = CustomNumberField(
      placeholder: "Entrer le Téléphone",
      title: "Téléphon Assuré",
      initialValue: '');
  CustomTextField emailB = CustomTextField(
      placeholder: "Entrer le mail", title: "Email Assuré", initialValue: '');

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    nomassureB.err = "Entrer le Nom ";
    prenomassureB.err = "Entrer le Prénom";
    adresseassureB.err = "Entrer l'Adresse'";
    codepostalB.err = "Entrer le Code Poastal";
    telephoneassureB.err = "Entrer le Téléphone";
    emailB.err = "Entrer le Mail";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informaions Assuré B"),
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
                      child: nomassureB.textfrofield(),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: prenomassureB.textfrofield(),
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                adresseassureB.textfrofield(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: codepostalB.textfrofield(),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: telephoneassureB.textfrofield(),
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                emailB.textfrofield(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if(_key.currentState!.validate()){
FirebaseFirestore.instance.collection('AssureB').add({
            'nom': nomassureB.value,
            'prenom': prenomassureB.value,
            'adress': adresseassureB.value,
            'code_postal': codepostalB.value,
            'telephone': telephoneassureB.value,
            'email': emailB.value,
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddAssuranceB()));
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
