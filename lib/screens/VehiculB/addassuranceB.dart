import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addconducteurA.dart';
import 'package:insertion_bd/screens/VehiculB/addconducteurB.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';

import '../../widgets/customTextField.dart';

class AddAssuranceB extends StatefulWidget {
  AddAssuranceB({Key? key}) : super(key: key);

  @override
  State<AddAssuranceB> createState() => _AddAssuranceBState();
}

class _AddAssuranceBState extends State<AddAssuranceB> {
  CustomTextField nomassuranceB = CustomTextField(
      placeholder: "Entrer le Nom", title: "Nom Assureur", initialValue: '');
  CustomNumberField numcontratB = CustomNumberField(
      placeholder: "Numero de contrat",
      title: "N° de Contrat",
      initialValue: '');
  CustomNumberField numcarteverteB = CustomNumberField(
      placeholder: "Entrer la carte verte",
      title: "N° Carte Verte",
      initialValue: '');

  CustomTextField agenceB = CustomTextField(
      placeholder: "Type agence",
      title: "Agence(ou Bureau ou Courtier)",
      initialValue: '');
  CustomTextField nomagence = CustomTextField(
      placeholder: "Nom Agence", title: "Nom", initialValue: '');
  CustomTextField adresseagenceB = CustomTextField(
      placeholder: "Adresse Agence", title: "Adresse", initialValue: '');
  CustomTextField paysagenceB = CustomTextField(
      placeholder: "Pays Agence", title: "Pays", initialValue: '');
  CustomNumberField telephoneagenceB = CustomNumberField(
      placeholder: "Téléphone Agence", title: "Téléphone", initialValue: '');
  TextEditingController dateinput = TextEditingController();
  CustomTextField emailagenceB = CustomTextField(
      placeholder: "Email Agence", title: "Email", initialValue: '');
  final _key = GlobalKey<FormState>();
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    nomassuranceB.err = "veillez entrer le Nom ";
    numcontratB.err = "veillez entrer le Numéro du contrat";
    numcarteverteB.err = "veillez entrer le Numéro de la carte verte'";
    agenceB.err = "veillez entrer te type D'agence";
    nomagence.err = "veillez entrer le Nom de l'agence";
    adresseagenceB.err = "veillez entrer l'Adresse l'agence'";
    paysagenceB.err = "veillez entrer le Pays Agence";
    telephoneagenceB.err = "veillez entrer le Téléphone";
    emailagenceB.err = "veillez entrer le Téléphone";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Société D'Assurance A",
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
                  " Assurance A",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                nomassuranceB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                numcontratB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                numcarteverteB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  ' Attestation Assurance valide:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
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
                const SizedBox(
                  width: 20,
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
                const SizedBox(
                  height: 20,
                ),
                agenceB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                nomagence.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                adresseagenceB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                paysagenceB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                telephoneagenceB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                emailagenceB.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                DropDownMultiSelect(
                  onChanged: (List<String> x) {
                    setState(() {
                      selected = x;
                    });
                  },
                  options: const [
                    'OUI',
                    'NON',
                  ],
                  selectedValues: selected,
                  whenEmpty:
                      'Les dégats matériels au véhicule sont assuré par le contrat',
                ),
                const SizedBox(
                  height: 55,
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('AssuranceB').add({
                      'nom': nomassuranceB.value,
                      'num_contrat': numcontratB.value,
                      'num_carte_verte': numcarteverteB.value,
                      'du': dateinput.text,
                      'au': dateinput.text,
                      'agence': agenceB.value,
                      'nom_agence': nomagence.value,
                      'adresse': adresseagenceB.value,
                      'pays': paysagenceB.value,
                      'telephone': telephoneagenceB.value,
                      'email': emailagenceB.value,
                      'prise_encharge': selected.toString(),
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddConducteurB()));
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
