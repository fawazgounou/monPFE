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
      placeholder: "Entrer le Nom", title: "Nom ", initialValue: '');
  CustomTextField prenomconducteurA = CustomTextField(
      placeholder: "Entrer le Prenom", title: "Prénom ", initialValue: '');
  CustomTextField adresseconducteurA = CustomTextField(
      placeholder: "Entrer l'Adresse", title: "Adresse ", initialValue: '');
  CustomTextField paysconducteurA = CustomTextField(
      placeholder: "Entrer le Pays", title: "Pays", initialValue: '');
  CustomNumberField telephoneconducteurA = CustomNumberField(
      placeholder: "Entrer le Téléphone", title: "Téléphon ", initialValue: '');
  CustomNumberField emailconducteurA = CustomNumberField(
      placeholder: "Entrer le mail", title: "Email ", initialValue: '');
  CustomNumberField numpermisdeconduireA = CustomNumberField(
      placeholder: "Entrer le Numéro",
      title: "N° Permis de Conduire",
      initialValue: '');
  CustomTextField categorieA = CustomTextField(
      placeholder: "Entrer la Catégorie",
      title: "Catégorie ",
      initialValue: '');

  final _key = GlobalKey<FormState>();

  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinputV = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    dateinputV.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    nomconducteurA.err = "Veuillez entrer le Nom ";
    prenomconducteurA.err = "Veuillez entrer le Prénom";
    adresseconducteurA.err = "Veuillez entrer l'Adresse'";
    paysconducteurA.err = "Veuillez entrer le Code Pays";
    telephoneconducteurA.err = "Veuillez entrer le Téléphone";
    emailconducteurA.err = "Veuillez entrer le Mail";
    numpermisdeconduireA.err = "Veuillez entrer le Numéro du Permis";
    categorieA.err = "Veuillez entrer la Catégorie";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informaions Conducteur A",
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
                    child: nomconducteurA.textfrofield(),
                    flex: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: prenomconducteurA.textfrofield(),
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
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
                height: 15,
              ),
              adresseconducteurA.textfrofield(),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: paysconducteurA.textfrofield(),
                    flex: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: telephoneconducteurA.textfrofield(),
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              emailconducteurA.textfrofield(),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: numpermisdeconduireA.textfrofield(),
                    flex: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: categorieA.textfrofield(),
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
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
                        labelText: "Permis valable jusqu'au"),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (_key.currentState!.validate()) {
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
              'fin_valide_permis': dateinputV.text,
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddObservationA()));
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
