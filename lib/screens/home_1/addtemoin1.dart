import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/Model/model.dart';
import 'package:insertion_bd/screens/VehiculA/addvehiculA.dart';
import 'package:insertion_bd/screens/home/addblesse.dart';
import 'package:insertion_bd/screens/home_1/addblesse1.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';

import 'package:responsive_row/responsive_row.dart';
import 'package:uuid/uuid.dart';
import '../../widgets/customTextField.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddTemoins1 extends StatefulWidget {
  var Sin;
  AddTemoins1({Key? key, this.Sin}) : super(key: key);

  @override
  State<AddTemoins1> createState() => _AddTemoins1State();
}

class _AddTemoins1State extends State<AddTemoins1> {
  var uuid = Uuid();
  var Temoin = [];
  CustomTextField nomtemoin = CustomTextField(
      placeholder: "Entrer le nom", title: "Nom", initialValue: '');
  CustomTextField prenomtemoin = CustomTextField(
      placeholder: "Entrer le Prenom", title: "Prénom", initialValue: '');
  CustomTextField adressetemoin = CustomTextField(
      placeholder: "Entrer  Adresse", title: "Adresse", initialValue: '');

  bool err = false;

  MaskTextInputFormatter maskFormatter =
      MaskTextInputFormatter(mask: '+(###) ##-##-##-##');
  TextEditingController numbertelephone = TextEditingController();

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    nomtemoin.err = "Entrer le Nom ";
    prenomtemoin.err = "Entrer le Prenom";
    adressetemoin.err = " Entrer l'Adresse'";

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
                    Expanded(
                      flex: 2,
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
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () async {
                          nomtemoin.controller.clear();
                          prenomtemoin.controller.clear();
                          adressetemoin.controller.clear();
                          numbertelephone.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.lightBlue.withOpacity(.7),
                        ),
                        child: const Text("+ de Témoin",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                            textAlign: TextAlign.center),
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
              uuid.v1(),
              nomtemoin.value,
              prenomtemoin.value,
              adressetemoin.value,
              numbertelephone.text
            ];
            print(widget.Sin);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddBlesse1(
                          Sin: widget.Sin,
                          Temoin: Temoin,
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
