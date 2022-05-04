import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addobservationA.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';
import 'package:insertion_bd/widgets/customTextField.dart';
import 'package:intl/intl.dart';

class AddConducteurA extends StatefulWidget {
  AddConducteurA({Key? key}) : super(key: key);

  @override
  State<AddConducteurA> createState() => _AddConducteurAState();
}

class _AddConducteurAState extends State<AddConducteurA> {
  CustomTextField nomconducteurA = CustomTextField(
      placeholder: "Entrer le Nom", title: "Nom Conducteur", initialValue: '');
  CustomTextField prenomconducteurA = CustomTextField(
      placeholder: "Entrer le Prenom",
      title: "Prénom Conducteur",
      initialValue: '');
  CustomTextField adresseconducteurA = CustomTextField(
      placeholder: "Entrer l'Adresse",
      title: "Adresse Conducteur",
      initialValue: '');
  CustomTextField paysconducteurA = CustomTextField(
      placeholder: "Entrer le Pays", title: "Pays", initialValue: '');
  CustomNumberField telephoneconducteurA = CustomNumberField(
      placeholder: "Entrer le Téléphone",
      title: "Téléphon Conducteur",
      initialValue: '');
      CustomNumberField emailconducteurA = CustomNumberField(
      placeholder: "Entrer le mail", title: "Email conducteur", initialValue: '');
  CustomNumberField numpermisdeconduireA = CustomNumberField(
      placeholder: "Entrer le Numéro",
      title: "N° Permis de Conduire",
      initialValue: '');
  CustomTextField categorieA = CustomTextField(
      placeholder: "Entrer la Catégorie",
      title: "Catégorie Conducteur",
      initialValue: '');
      

  final _key = GlobalKey<FormState>();
  
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      nomconducteurA.err = "veillez entrer le Nom ";
    prenomconducteurA.err = "veillez entrer le Prénom";
    adresseconducteurA.err = "veillez entrer l'Adresse'";
    paysconducteurA.err = "veillez entrer le Code Pays";
    telephoneconducteurA.err = "veillez entrer le Téléphone";
     emailconducteurA.err = "veillez entrer le Mail";
     numpermisdeconduireA.err = "veillez entrer le Numéro du Permis";
    categorieA.err = "veillez entrer la Catégorie";
       return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informaions Conducteur A",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
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
                  " Conducteur A",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                nomconducteurA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                prenomconducteurA.textfrofield(),
                 const SizedBox(
                  height: 20,
                ),
                 Container(
                  child: Center(
                    child: TextField(
                      controller: dateinput,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Date de naissance'),
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
                const SizedBox(
                  height: 20,
                ),
                adresseconducteurA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                paysconducteurA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                telephoneconducteurA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                emailconducteurA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                numpermisdeconduireA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                categorieA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                 Container(
                  child: Center(
                    child: TextField(
                      controller: dateinput,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'Date de naissance'),
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

                const SizedBox(
                  height: 55,
                ),
                ElevatedButton(
                   
                  onPressed: () {
                     FirebaseFirestore.instance.collection('ConducteurA').add({
                      'nom': nomconducteurA.value,
                      'prenom': prenomconducteurA.value,
                      'adresse': adresseconducteurA.value,
                      'date_naissance': dateinput.text,
                      'pays': paysconducteurA.value,
                      'telephone': telephoneconducteurA.value,
                       'email': emailconducteurA.value,
                      'num_permis': numpermisdeconduireA.value,
                      'categorie': categorieA.value,
                      'fin_valide_permis': dateinput.text,
                      });  
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddObservationA()));
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
