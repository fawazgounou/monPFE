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
      placeholder: "Entrer le noms", title: "Nom Témoins", initialValue: '');
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
    prenomtemoin.err = "veillez entrer Prenom";
    adressetemoin.err = "veillez entrer l'Adresse'";
    telephone.err = "veillez entrer le Téléphone";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter des Temoins"),
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
                  "Nouveaux Témoins",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                nomtemoin.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                prenomtemoin.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                adressetemoin.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                telephone.textfrofield(),
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
                ElevatedButton(
                  onPressed: () {
                    
        
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const AddBlesse()));
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
