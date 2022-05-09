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
      placeholder: "Entrer le Nom", title: "Nom ", initialValue: '');
  CustomTextField prenomconducteurB = CustomTextField(
      placeholder: "Entrer le Prenom", title: "Prénom ", initialValue: '');
  CustomTextField adresseconducteurB = CustomTextField(
      placeholder: "Entrer l'Adresse", title: "Adresse ", initialValue: '');
  CustomTextField paysconducteurB = CustomTextField(
      placeholder: "Entrer le Pays", title: "Pays", initialValue: '');
  CustomNumberField telephoneconducteurB = CustomNumberField(
      placeholder: "Entrer le Téléphone", title: "Téléphon ", initialValue: '');
  CustomNumberField emailconducteurB = CustomNumberField(
      placeholder: "Entrer le mail", title: "Email ", initialValue: '');
  CustomNumberField numpermisdeconduireB = CustomNumberField(
      placeholder: "Entrer le Numéro",
      title: "N° Permis de Conduire",
      initialValue: '');
  CustomTextField categorieB = CustomTextField(
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
    nomconducteurB.err = "Entrer le Nom ";
    prenomconducteurB.err = "Entrer le Prénom";
    adresseconducteurB.err = "Entrer l'Adresse'";
    paysconducteurB.err = "Entrer le Code Pays";
    telephoneconducteurB.err = "Entrer le Téléphone";
    emailconducteurB.err = "Entrer le Mail";
    numpermisdeconduireB.err = "Entrer le Numéro du Permis";
    categorieB.err = "Entrer la Catégorie";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informaions Conducteur B",
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
                    child: nomconducteurB.textfrofield(),
                    flex: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: prenomconducteurB.textfrofield(),
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
              adresseconducteurB.textfrofield(),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: paysconducteurB.textfrofield(),
                    flex: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: telephoneconducteurB.textfrofield(),
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              emailconducteurB.textfrofield(),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: numpermisdeconduireB.textfrofield(),
                    flex: 1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: categorieB.textfrofield(),
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
              'fin_valide_permis': dateinputV.text,
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddObservationB()));
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
