import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addobservationA.dart';
import 'package:insertion_bd/screens/VehiculB/addobservationB.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';
import 'package:insertion_bd/widgets/customTextField.dart';
import 'package:intl/intl.dart';

class AddConducteurB extends StatefulWidget {
  AddConducteurB({Key? key}) : super(key: key);

  @override
  State<AddConducteurB> createState() => _AddConducteurBState();
}

class _AddConducteurBState extends State<AddConducteurB> {
  CustomTextField nomconducteurB = CustomTextField(
      placeholder: "Entrer le Nom", title: "Nom Conducteur", initialValue: '');
  CustomTextField prenomconducteurB = CustomTextField(
      placeholder: "Entrer le Prenom",
      title: "Prénom Conducteur",
      initialValue: '');
  CustomTextField adresseconducteurB = CustomTextField(
      placeholder: "Entrer l'Adresse",
      title: "Adresse Conducteur",
      initialValue: '');
  CustomTextField paysconducteurB = CustomTextField(
      placeholder: "Entrer le Pays", title: "Pays", initialValue: '');
  CustomNumberField telephoneconducteurB = CustomNumberField(
      placeholder: "Entrer le Téléphone",
      title: "Téléphon Conducteur",
      initialValue: '');
       CustomNumberField emailconducteurB = CustomNumberField(
      placeholder: "Entrer le mail", title: "Email conducteur", initialValue: '');
  CustomNumberField numpermisdeconduireB = CustomNumberField(
      placeholder: "Entrer le Numéro",
      title: "N° Permis de Conduire",
      initialValue: '');
  CustomTextField categorieB = CustomTextField(
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
      nomconducteurB.err = "veillez entrer le Nom ";
    prenomconducteurB.err = "veillez entrer le Prénom";
    adresseconducteurB.err = "veillez entrer l'Adresse'";
    paysconducteurB.err = "veillez entrer le Code Pays";
     telephoneconducteurB.err = "veillez entrer le Téléphone";
     emailconducteurB.err = "veillez entrer le Mail";
     numpermisdeconduireB.err = "veillez entrer le Numéro du Permis";
    categorieB.err = "veillez entrer la Catégorie'";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informaion Conducteur A",
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
                nomconducteurB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                prenomconducteurB.textfrofield(),
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
                adresseconducteurB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                paysconducteurB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                telephoneconducteurB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                emailconducteurB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                numpermisdeconduireB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                categorieB.textfrofield(),
                const SizedBox(
                  height: 55,
                ),
                ElevatedButton(
                  onPressed: () {
                  FirebaseFirestore.instance.collection('ConducteurB').add({
                      'nom': nomconducteurB.value,
                      'prenom': prenomconducteurB.value,
                      'adresse': adresseconducteurB.value,
                      'date_naissance': dateinput.text,
                      'pays': paysconducteurB.value,
                      'telephone': telephoneconducteurB.value,
                       'email': emailconducteurB.value,
                      'num_permis': numpermisdeconduireB.value,
                      'categorie': categorieB.value,
                      'fin_valide_permis': dateinput.text,
                      });  
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddObservationB()));
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
