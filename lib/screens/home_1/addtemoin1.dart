import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addvehiculA.dart';
import 'package:insertion_bd/screens/home/addblesse.dart';
import 'package:insertion_bd/screens/home_1/addblesse1.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';
import 'package:responsive_row/responsive_row.dart';
import '../../widgets/customTextField.dart';

class AddTemoins1 extends StatefulWidget {
  const AddTemoins1({Key? key}) : super(key: key);

  @override
  State<AddTemoins1> createState() => _AddTemoins1State();
}

class _AddTemoins1State extends State<AddTemoins1> {
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
    nomtemoin.err = "Veuillez entrer le Nom ";
    prenomtemoin.err = "Veuillez entrer Prenom";
    adressetemoin.err = "Veuillez entrer l'Adresse'";
    telephone.err = "Veuillez entrer le Téléphone";
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
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: nomtemoin.textfrofield(),
                    flex: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: prenomtemoin.textfrofield(),
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              adressetemoin.textfrofield(),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(flex: 1, child: telephone.textfrofield()),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
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
                        "+ de Témoin",
                        style: TextStyle(color: Colors.white, fontSize: 19),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if(_key.currentState!.validate()){
         Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddBlesse1()));
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
