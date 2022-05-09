import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/1_VehiculeA/addconducteurA1.dart';
import 'package:insertion_bd/screens/VehiculA/addconducteurA.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';

import '../../widgets/customTextField.dart';

class AddAssuranceA1 extends StatefulWidget {
  AddAssuranceA1({Key? key}) : super(key: key);

  @override
  State<AddAssuranceA1> createState() => _AddAssuranceA1State();
}

class _AddAssuranceA1State extends State<AddAssuranceA1> {
  CustomTextField nomassuranceA = CustomTextField(
      placeholder: "Entrer le Nom", title: "Nom Assureur", initialValue: '');
  CustomNumberField numcontratA = CustomNumberField(
      placeholder: "Numero de contrat",
      title: "N° de Contrat",
      initialValue: '');
  CustomNumberField numcarteverteA = CustomNumberField(
      placeholder: "Entrer la carte verte",
      title: "N° Carte Verte",
      initialValue: '');

  CustomTextField agenceA = CustomTextField(
      placeholder: "Type agence",
      title: " Bureau ou Courtier",
      initialValue: '');
  CustomTextField nomagence = CustomTextField(
      placeholder: "Nom Agence", title: "Nom", initialValue: '');
  CustomTextField adresseagenceA = CustomTextField(
      placeholder: "Adresse Agence", title: "Adresse", initialValue: '');
  CustomTextField paysagenceA = CustomTextField(
      placeholder: "Pays Agence", title: "Pays", initialValue: '');
  CustomNumberField telephoneagenceA = CustomNumberField(
      placeholder: "Téléphone Agence", title: "Téléphone", initialValue: '');
  CustomTextField emailagenceA = CustomTextField(
      placeholder: "Email Agence", title: "Email", initialValue: '');
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput2 = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  void initState() {
    dateinput.text = "";
    dateinput2.text = "";
    super.initState();
  }

  bool oui = false;
  bool non = false;

  @override
  Widget build(BuildContext context) {
    nomassuranceA.err = "Veuillez entrer le Nom ";
    numcontratA.err = "Veuillez entrer le Numéro du contrat";
    numcarteverteA.err = "Veuillez entrer le Numéro de la carte verte'";
    agenceA.err = "Veuillez entrer te type D'agence";
    nomagence.err = "Veuillez entrer le Nom de l'agence";
    adresseagenceA.err = "Veuillez entrer l'Adresse l'agence'";
    paysagenceA.err = "Veuillez entrer le Pays Agence";
    telephoneagenceA.err = "Veuillez entrer le Téléphone";
    emailagenceA.err = "Veuillez entrer le Téléphone";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Société D'Assurance A",
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
                nomassuranceA.textfrofield(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: numcontratA.textfrofield(),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: numcarteverteA.textfrofield(),
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  ' Attestation Assurance valide:',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Center(
                          child: TextFormField(
                            controller: dateinput,
                            validator: (value) {
                          if (value!.isEmpty) {
                            return "Entrer la Date";
                          } else {
                            return null;
                          }
                        },
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                ),
                                labelStyle: TextStyle(color: Colors.black),
                                labelText: 'Du'),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate);
                                setState(() {
                                  dateinput.text = formattedDate;
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Center(
                          child: TextFormField(
                            controller: dateinput2,
                            validator: (value) {
                          if (value!.isEmpty) {
                            return "Entrer la Date";
                          } else {
                            return null;
                          }
                        },
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                ),
                                labelStyle: TextStyle(color: Colors.black),
                                labelText: 'Au'),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2101));

                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate);
                                setState(() {
                                  dateinput.text = formattedDate;
                                });
                              } else {
                                print("Date is not selected");
                              }
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: agenceA.textfrofield(),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: telephoneagenceA.textfrofield(),
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                adresseagenceA.textfrofield(),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: nomagence.textfrofield(),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: paysagenceA.textfrofield(),
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                emailagenceA.textfrofield(),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  " Les dégâts matériels au véhicule sont-ils assurés par le contrat ?",
                  style: TextStyle(color: Colors.black, fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: [
                          Checkbox(
                            value: oui,
                            onChanged: (value) {
                              setState(() {
                                oui = true;
                                non = false;
                              });
                            },
                          ),
                          Text('OUI')
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Checkbox(
                            value: non,
                            onChanged: (value) {
                              setState(() {
                                oui = false;
                                non = true;
                              });
                            },
                          ),
                          Text('NON')
                        ],
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
            String index = '';
            if (oui == true) {
              index = 'Oui';
            }
            if (non == true) {
              index = 'Non';
            }
            FirebaseFirestore.instance.collection('AssuranceA').add({
              'nom': nomassuranceA.value,
              'num_contrat': numcontratA.value,
              'num_carte_verte': numcarteverteA.value,
              'du': dateinput.text,
              'au': dateinput2.text,
              'agence': agenceA.value,
              'nom_agence': nomagence.value,
              'adresse': adresseagenceA.value,
              'pays': paysagenceA.value,
              'telephone': telephoneagenceA.value,
              'email': emailagenceA.value,
              'prise_encharge': index.toString(),
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddConducteurA1()));
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
