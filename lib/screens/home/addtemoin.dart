import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/Model/model.dart';
import 'package:insertion_bd/screens/VehiculA/addvehiculA.dart';
import 'package:insertion_bd/screens/home/addblesse.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';
import 'package:responsive_row/responsive_row.dart';
import '../../widgets/customTextField.dart';

class AddTemoins extends StatefulWidget {
  var Sin;
  AddTemoins({Key? key, this.Sin}) : super(key: key);

  @override
  State<AddTemoins> createState() => _AddTemoinsState();
}

class _AddTemoinsState extends State<AddTemoins> {
  var Temoin = [];
  CustomTextField nomtemoin = CustomTextField(
      placeholder: "Entrer le nom", title: "Nom", initialValue: '');
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
    nomtemoin.err = "Entrer le Nom ";
    prenomtemoin.err = "Entrer le Prenom";
    adressetemoin.err = " Entrer l'Adresse'";
    telephone.err = " Entrer le Téléphone";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ajouter des Temoins ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
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
                         /*  Temoin.add(
                            nomtemoin.value,
                           prenomtemoin.value,
                              adressetemoin.value, telephone.value); */
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
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (_key.currentState!.validate()) {
            Temoin = [
              nomtemoin.value,
              prenomtemoin.value,
              adressetemoin.value,
              telephone.value
            ];
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  AddBlesse(
                 Sin: widget.Sin,
                 Temoin: Temoin,
                 
                )));
          }
        },
        child: Container(
          height: 50.0,
          width: double.infinity,
          color: Colors.blue,
          child: Text(
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
