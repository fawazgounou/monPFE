import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/Model/model.dart';
import 'package:insertion_bd/screens/1_VehiculA/addvehiculA1.dart';
import 'package:insertion_bd/screens/VehiculA/addvehiculA.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/customTextField.dart';

class AddBlesse1 extends StatefulWidget {
  var Sin;
  var Temoin;
  AddBlesse1({Key? key, this.Sin, this.Temoin}) : super(key: key);

  @override
  State<AddBlesse1> createState() => _AddBlesse1State();
}

class _AddBlesse1State extends State<AddBlesse1> {
  var uuid = Uuid();
  var blesse = [];
  CustomTextField nomblesse = CustomTextField(
      placeholder: "Entrer le noms", title: "Nom Blessé(s)", initialValue: '');
  CustomTextField prenomblesse = CustomTextField(
      placeholder: "Entrer le Prenom",
      title: "Prénom Blessé(s)",
      initialValue: '');
  CustomTextField adresseblesse = CustomTextField(
      placeholder: "Entrer  Adresse",
      title: "Adresse Blessé(s)",
      initialValue: '');

  CustomTextField profession = CustomTextField(
      placeholder: "Entrer la profession",
      title: "Profession",
      initialValue: '');
  CustomTextField situation = CustomTextField(
      placeholder:
          "(conducteur, passager du vehicule A ou B, cycliste, piéton)",
      title: "Situation au moment de l'accident",
      initialValue: '');
  CustomTextField casqueceinture = CustomTextField(
      placeholder: "", title: "casque ou ceinture ?", initialValue: '');
  CustomTextField premiersoinslieu = CustomTextField(
      placeholder: "Entrer lieu hospitalisation",
      title: "Soins ou Hospitalisation",
      initialValue: '');
  CustomTextField gravitenature = CustomTextField(
      placeholder: "Entrer la gravité",
      title: " Gravité des Blessures",
      initialValue: '');
   MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(mask: '+(###) ##-##-##-##');
   TextEditingController numbertelephone = TextEditingController();

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    nomblesse.err = "Entrer le Nom";
    prenomblesse.err = "Entrer le Prénom";
    adresseblesse.err = "Entrer l'Adresse ";

    profession.err = "Entrer la Profession";
    situation.err = "Entrer la Situation ";
    casqueceinture.err = "Entrer repondre ";
    premiersoinslieu.err = "Entrer le Lieu du premier soin";
    gravitenature.err = "Entrer le niveau de blessure";

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ajouter des Blessés",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                    Expanded(flex: 1, child: nomblesse.textfrofield()),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: prenomblesse.textfrofield(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                adresseblesse.textfrofield(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
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
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: profession.textfrofield(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                situation.textfrofield(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: gravitenature.textfrofield(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: casqueceinture.textfrofield(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                premiersoinslieu.textfrofield(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(flex: 1, child: Text('')),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: ElevatedButton(
                        onPressed: () async {
                          nomblesse.controller.clear();
                          prenomblesse.controller.clear();
                          adresseblesse.controller.clear();
                          numbertelephone.clear();
                          profession.controller.clear();
                          situation.controller.clear();
                          casqueceinture.controller.clear();
                          premiersoinslieu.controller.clear();
                          gravitenature.controller.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          shadowColor: Colors.lightBlue.withOpacity(.7),
                        ),
                        child: const Text(
                          "+ de Blessé",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 55,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (_key.currentState!.validate()) {
            blesse = [
              uuid.v1(),
              nomblesse.value,
              prenomblesse.value,
              adresseblesse.value,
              numbertelephone.text,
              profession.value,
              situation.value,
              casqueceinture.value,
              premiersoinslieu.value,
              gravitenature.value
            ];
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddVehiculA1(
                          Sin: widget.Sin,
                          Temoin: widget.Temoin,
                          blesse: blesse,
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
