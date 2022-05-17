import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/Model/model.dart';
import 'package:insertion_bd/screens/VehiculA/addassur%C3%A9A.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/customTextField.dart';

class AddVehiculA extends StatefulWidget {
  var Sin;
  var Temoin;
  var blesse;
  AddVehiculA({
    Key? key,
    this.Sin,
    this.Temoin,
    this.blesse,
  }) : super(key: key);

  @override
  State<AddVehiculA> createState() => _AddVehiculAState();
}

class _AddVehiculAState extends State<AddVehiculA> {
  var uuid = Uuid();
  var vehiculeA = [];
  CustomTextField marqueA = CustomTextField(
      placeholder: "Entrer la Marque", title: "Marque, Type", initialValue: '');
  CustomTextField immatriculationVA = CustomTextField(
      placeholder: "Entrer l'immatriculaton",
      title: "N°Immatriculation",
      initialValue: '');
  CustomTextField paysimmatriculationVA = CustomTextField(
      placeholder: "Entrer le Pays d'immatricuation",
      title: "Pays D'immatriculation",
      initialValue: '');

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    marqueA.err = "Entrer la Marque ";
    immatriculationVA.err = "Entrer l'Immatriculation";
    paysimmatriculationVA.err = "Entrer le Pays'";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Informaions Véhicule A"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _key,
            child: Column(
              children: [
                marqueA.textfrofield(),
                const SizedBox(
                  height: 15,
                ),
                immatriculationVA.textfrofield(),
                const SizedBox(
                  height: 15,
                ),
                paysimmatriculationVA.textfrofield(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (_key.currentState!.validate()) {
            vehiculeA = [
              uuid.v1(),
              marqueA.value,
              immatriculationVA.value,
              paysimmatriculationVA.value
            ];

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddAssureA(
                          Sin: widget.Sin,
                          Temoin: widget.Temoin,
                          blesse: widget.blesse,
                          vehiculeA: vehiculeA,
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
