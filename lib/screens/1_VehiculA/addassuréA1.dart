import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/Model/model.dart';
import 'package:insertion_bd/screens/1_VehiculA/addassuranceA1.dart';
import 'package:insertion_bd/screens/VehiculA/addassuranceA.dart';
import 'package:insertion_bd/screens/VehiculA/addconducteurA.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/customTextField.dart';

class AddAssureA1 extends StatefulWidget {
  var Sin;
  var Temoin;
  var blesse;
  var vehiculeA;
  AddAssureA1({Key? key, this.Sin, this.Temoin, this.blesse, this.vehiculeA})
      : super(key: key);

  @override
  State<AddAssureA1> createState() => _AddAssureA1State();
}

class _AddAssureA1State extends State<AddAssureA1> {
  var uuid = Uuid();
  var assureA = [];
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

  CustomTextField emailA = CustomTextField(
      placeholder: "Entrer le mail", title: "Email Assuré", initialValue: '');
  final maskFormatter = MaskTextInputFormatter(mask: '+(###) ##-##-##-##');
  final TextEditingController numbertelephone = TextEditingController();

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    nomassureA.err = "Entrer le Nom ";
    prenomassureA.err = "Entrer le Prénom";
    adresseassureA.err = "Entrer l'Adresse'";
    codepostalA.err = "Entrer le Code Poastal";

    emailA.err = "Entrer le Mail";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informaions Assuré A", style: TextStyle(fontWeight: FontWeight.bold)),
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
                      flex: 1,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Entrer le Téléphone";
                          } else {
                            return null;
                          }
                        },
                        controller: numbertelephone,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(hintText: 'Téléphone', hintStyle: TextStyle(color: Colors.black)),
                        inputFormatters: [maskFormatter],
                      ),
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
          if (_key.currentState!.validate()) {
            assureA = [
              uuid.v1(),
              nomassureA.value,
              prenomassureA.value,
              numbertelephone.value,
              adresseassureA.value,
              codepostalA.value,
              emailA.value
            ];
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddAssuranceA1(
                          Sin: widget.Sin,
                          Temoin: widget.Temoin,
                          blesse: widget.blesse,
                          vehiculeA: widget.vehiculeA,
                          assureA: assureA,
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
