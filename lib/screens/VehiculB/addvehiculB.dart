import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addassur%C3%A9A.dart';
import 'package:insertion_bd/screens/VehiculB/addassur%C3%A9B.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';

import '../../widgets/customTextField.dart';

class AddVehiculB extends StatefulWidget {
  AddVehiculB({Key? key}) : super(key: key);

  @override
  State<AddVehiculB> createState() => _AddVehiculBState();
}

class _AddVehiculBState extends State<AddVehiculB> {
  CustomTextField marqueB = CustomTextField(
      placeholder: "Entrer la Marque", title: "Marque, Type", initialValue: '');
  CustomNumberField immatriculationVB = CustomNumberField(
      placeholder: "Entrer l'immatriculaton",
      title: "N°Immatriculation",
      initialValue: '');
  CustomNumberField paysimmatriculationVB = CustomNumberField(
      placeholder: "Entrer le Pays d'immatricuation",
      title: "Pays D'immatriculation",
      initialValue: '');

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    marqueB.err = "Entrer la Marque ";
    immatriculationVB.err = "Entrer l'Immatriculation";
    paysimmatriculationVB.err = "Entrer le Pays'";

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
                marqueB.textfrofield(),
                const SizedBox(
                  height: 15,
                ),
                immatriculationVB.textfrofield(),
                const SizedBox(
                  height: 15,
                ),
                paysimmatriculationVB.textfrofield(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if(_key.currentState!.validate()){
  FirebaseFirestore.instance.collection('VehiculeB').add({
            'marque': marqueB.value,
            'numero_immatriculation': immatriculationVB.value,
            'pays_immatriculation': paysimmatriculationVB.value,
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddAssureB()));
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
