import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    nomassureB.err = "veillez entrer le Nom ";
    prenomassureB.err = "veillez entrer le Prénom";
    adresseassureB.err = "veillez entrer l'Adresse'";
    codepostalB.err = "veillez entrer le Code Poastal";
    telephoneassureB.err = "veillez entrer le Téléphone";
    emailB.err = "veillez entrer le Mail";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informaion Assuré B"),
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
                  " Assuré B",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                nomassureB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                prenomassureB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                adresseassureB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                codepostalB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                telephoneassureB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                emailB.textfrofield(),
                const SizedBox(
                  height: 55,
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('AssureB').add({
                      'nom': nomassureB.value,
                      'prenom': prenomassureB.value,
                      'adress': adresseassureB.value,
                      'code_postal': codepostalB.value,
                      'telephone': telephoneassureB.value,
                      'email': emailB.value,
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddAssuranceB()));
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
