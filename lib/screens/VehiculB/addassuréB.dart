import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addassuranceA.dart';
import 'package:insertion_bd/screens/VehiculA/addconducteurA.dart';
import 'package:insertion_bd/screens/VehiculB/addassuranceB.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/customTextField.dart';

class AddAssureB extends StatefulWidget {
  var Sin;
  var Temoin;
  var blesse;
  var vehiculeA;
  var assureA;
  var assuranceA;
  var conductA;
  var observ;
  var photo;

  var circonstanceA;
  var signature;
  var imagesignature;
  var transA;
  var vehiculeB;
  AddAssureB(
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
      this.circonstanceA,
      this.signature,
      this.imagesignature,
      this.transA,
      this.vehiculeB})
      : super(key: key);

  @override
  State<AddAssureB> createState() => _AddAssureBState();
}

class _AddAssureBState extends State<AddAssureB> {
  var uuid = Uuid();
  var assureB = [];
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

  CustomTextField emailB = CustomTextField(
      placeholder: "Entrer le mail", title: "Email Assuré", initialValue: '');

  final _key = GlobalKey<FormState>();
  MaskTextInputFormatter maskFormatter =
      MaskTextInputFormatter(mask: '+(###) ##-##-##-##');
  TextEditingController numbertelephone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nomassureB.err = "Entrer le Nom ";
    prenomassureB.err = "Entrer le Prénom";
    adresseassureB.err = "Entrer l'Adresse'";
    codepostalB.err = "Entrer le Code Poastal";

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
                        decoration: const InputDecoration(
                            hintText: 'Téléphone',
                            hintStyle: TextStyle(color: Colors.black)),
                        inputFormatters: [maskFormatter],
                      ),
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
          if (_key.currentState!.validate()) {
            assureB = [
              uuid.v1(),
              nomassureB.value,
              prenomassureB.value,
              adresseassureB.value,
              codepostalB.value,
              numbertelephone.text,
              emailB.value
            ];
            /*  FirebaseFirestore.instance.collection('AssureB').add({
              'nom': nomassureB.value,
              'prenom': prenomassureB.value,
              'adress': adresseassureB.value,
              'code_postal': codepostalB.value,
              'telephone': telephoneassureB.value,
              'email': emailB.value,
            }); */
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddAssuranceB(
                          Sin: widget.Sin,
                          Temoin: widget.Temoin,
                          blesse: widget.blesse,
                          vehiculeA: widget.vehiculeA,
                          assureA: widget.assureA,
                          assuranceA: widget.assuranceA,
                          conductA: widget.conductA,
                          observ: widget.observ,
                          photo: widget.photo,
                          circonstanceA: widget.circonstanceA,
                          signature: widget.signature,
                          imagesignature: widget.imagesignature,
                          transA: widget.transA,
                          vehiculeB: widget.vehiculeB,
                          assureB: assureB,
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
