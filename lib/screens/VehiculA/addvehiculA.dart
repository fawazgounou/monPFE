import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addassur%C3%A9A.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';

import '../../widgets/customTextField.dart';

class AddVehiculA extends StatefulWidget {
  AddVehiculA({Key? key}) : super(key: key);

  @override
  State<AddVehiculA> createState() => _AddVehiculAState();
}

class _AddVehiculAState extends State<AddVehiculA> {
  CustomTextField marqueA = CustomTextField(
      placeholder: "Entrer la Marque", title: "Marque, Type", initialValue: '');
  CustomNumberField immatriculationVA = CustomNumberField(
      placeholder: "Entrer l'immatriculaton",
      title: "N°Immatriculation",
      initialValue: '');
  CustomNumberField paysimmatriculationVA = CustomNumberField(
      placeholder: "Entrer le Pays d'immatricuation",
      title: "Pays D'immatriculation",
      initialValue: '');

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    marqueA.err = "veillez entrer la Marque ";
    immatriculationVA.err = "veillez entrer l'Immatriculation";
    paysimmatriculationVA.err = "veillez entrer le Pays'";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Informaions Véhicule A"),
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
                  " Véhicule A",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                marqueA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                immatriculationVA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                paysimmatriculationVA.textfrofield(),
                const SizedBox(
                  height: 200,
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('VehiculeA').add({
                      'marque': marqueA.value,
                      'numero_immatriculation': immatriculationVA.value,
                      'pays_immatriculation': paysimmatriculationVA.value,
                    });

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddAssureA()));
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
