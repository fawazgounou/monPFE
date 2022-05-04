import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  CustomTextField paysimmatriculationVB = CustomTextField(
      placeholder: "Entrer le Pays d'immatricuation",
      title: "Pays D'immatriculation",
      initialValue: '');

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     marqueB.err = "veillez entrer la Marque ";
    immatriculationVB.err = "veillez entrer l'Immatriculation";
    paysimmatriculationVB.err = "veillez entrer le Pays'";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Informaion Véhicul B"),
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
                  " Véhicul B",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                marqueB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                immatriculationVB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                paysimmatriculationVB.textfrofield(),
                const SizedBox(
                  height: 200,
                ),
                ElevatedButton(
                  onPressed: () {
                      FirebaseFirestore.instance.collection('VehiculeB').add({
                      'marque': marqueB.value,
                      'numero_immatriculation': immatriculationVB.value,
                      'pays_immatriculation': paysimmatriculationVB.value,
                    });

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddAssureB()));
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
