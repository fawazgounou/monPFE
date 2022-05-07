import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addvehiculA.dart';
import 'package:insertion_bd/screens/home/addblesse.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';

import '../../widgets/customTextField.dart';

class AddTemoins extends StatefulWidget {
  const AddTemoins({Key? key}) : super(key: key);

  @override
  State<AddTemoins> createState() => _AddTemoinsState();
}

class _AddTemoinsState extends State<AddTemoins> {
  CustomTextField nomtemoin = CustomTextField(
      placeholder: "Entrer le noms", title: "Nom", initialValue: '');
  CustomTextField prenomtemoin = CustomTextField(
      placeholder: "Entrer le Prenom", title: "Prénom", initialValue: '');
  CustomTextField adressetemoin = CustomTextField(
      placeholder: "Entrer  Adresse", title: "Adresse", initialValue: '');
  CustomNumberField telephone = CustomNumberField(
      placeholder: "Entrer le téléphone", title: "Téléphone", initialValue: '');
  bool err = false;
  var result;
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    nomtemoin.err = "veillez entrer le Nom ";
    prenomtemoin.err = "Veillez entrer Prenom";
    adressetemoin.err = "Veillez entrer l'Adresse'";
    telephone.err = "Veillez entrer le Téléphone";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ajouter des Temoins",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    child: nomtemoin.textfrofield(),
                    width: 160,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    child: prenomtemoin.textfrofield(),
                    width: 160,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    child: adressetemoin.textfrofield(),
                    width: 160,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    child: telephone.textfrofield(),
                    width: 160,
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                onPressed: () async {
                  FirebaseFirestore.instance.collection('Temoins').add({
                    'nom': nomtemoin.value,
                    'prenom': prenomtemoin.value,
                    'adresse': adressetemoin.value,
                    'telephone': telephone.value,
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  shadowColor: Colors.lightBlue.withOpacity(.7),
                ),
                child: const Text(
                  "Ajouter un Témoin",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 55,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          FirebaseFirestore.instance.collection('Temoins').add({
            'nom': nomtemoin.value,
            'prenom': prenomtemoin.value,
            'adresse': adressetemoin.value,
            'telephone': telephone.value,
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddBlesse()));
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
