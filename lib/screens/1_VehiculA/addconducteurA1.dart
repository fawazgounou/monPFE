import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/Model/model.dart';
import 'package:insertion_bd/screens/1_VehiculA/addobservationA1.dart';
import 'package:insertion_bd/screens/VehiculA/addobservationA.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';
import 'package:insertion_bd/widgets/customTextField.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:uuid/uuid.dart';

class AddConducteurA1 extends StatefulWidget {
  var Sin;
  var Temoin;
  var blesse;
  var vehiculeA;
  var assureA;
  var assuranceA;
  AddConducteurA1(
      {Key? key,
      this.Sin,
      this.Temoin,
      this.blesse,
      this.vehiculeA,
      this.assureA,
      this.assuranceA})
      : super(key: key);

  @override
  State<AddConducteurA1> createState() => _AddConducteurA1State();
}

class _AddConducteurA1State extends State<AddConducteurA1> {
  var uuid = Uuid();
  var conductA = [];
  CustomTextField nomconducteurA = CustomTextField(
      placeholder: "Entrer le Nom", title: "Nom ", initialValue: '');
  CustomTextField prenomconducteurA = CustomTextField(
      placeholder: "Entrer le Prenom", title: "Prénom ", initialValue: '');
  CustomTextField adresseconducteurA = CustomTextField(
      placeholder: "Entrer l'Adresse", title: "Adresse ", initialValue: '');
  CustomTextField paysconducteurA = CustomTextField(
      placeholder: "Entrer le Pays", title: "Pays", initialValue: '');
  CustomNumberField telephoneconducteurA = CustomNumberField(
      placeholder: "Entrer le Téléphone",
      title: "Téléphone ",
      initialValue: '');
  CustomTextField emailconducteurA = CustomTextField(
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

   MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(mask: '+(###) ##-##-##-##');
   TextEditingController numbertelephone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nomconducteurA.err = "Entrer le Nom ";
    prenomconducteurA.err = "Entrer le Prénom";
    adresseconducteurA.err = "Entrer l'Adresse'";
    paysconducteurA.err = "Entrer le Code Pays";

    emailconducteurA.err = "Entrer le Mail";
    numpermisdeconduireA.err = "Entrer le Numéro du Permis";
    categorieA.err = "Entrer la Catégorie";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informaions Conducteur A",
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
                      controller: dateinputV,
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
                            dateinputV.text = formattedDate;
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
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (_key.currentState!.validate()) {
            conductA = [
              uuid.v1(),
              nomconducteurA.value,
              prenomconducteurA.value,
              adresseconducteurA.value,
              dateinput.text,
              paysconducteurA.value,
              numbertelephone.value,
              categorieA.value,
              emailconducteurA.value,
              dateinputV.text,
              numpermisdeconduireA.value
            ];

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddObservationA1(
                          Sin: widget.Sin,
                          Temoin: widget.Temoin,
                          blesse: widget.blesse,
                          vehiculeA: widget.vehiculeA,
                          assureA: widget.assureA,
                          assuranceA: widget.assuranceA,
                          conductA: conductA,
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
