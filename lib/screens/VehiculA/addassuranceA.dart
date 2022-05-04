import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addconducteurA.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';
import 'package:intl/intl.dart';
import 'package:multiselect/multiselect.dart';

import '../../widgets/customTextField.dart';

class AddAssuranceA extends StatefulWidget {
  AddAssuranceA({Key? key}) : super(key: key);

  @override
  State<AddAssuranceA> createState() => _AddAssuranceAState();
}

class _AddAssuranceAState extends State<AddAssuranceA> {
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
      title: "Agence(ou Bureau ou Courtier)",
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
  final _key = GlobalKey<FormState>();
  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    nomassuranceA.err = "veillez entrer le Nom ";
    numcontratA.err = "veillez entrer le Numéro du contrat";
    numcarteverteA.err = "veillez entrer le Numéro de la carte verte'";
    agenceA.err = "veillez entrer te type D'agence";
    nomagence.err = "veillez entrer le Nom de l'agence";
    adresseagenceA.err = "veillez entrer l'Adresse l'agence'";
    paysagenceA.err = "veillez entrer le Pays Agence";
    telephoneagenceA.err = "veillez entrer le Téléphone";
    emailagenceA.err = "veillez entrer le Téléphone";
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
                nomassuranceA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                numcontratA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                numcarteverteA.textfrofield(),
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
                agenceA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                nomagence.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                adresseagenceA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                paysagenceA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                telephoneagenceA.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                emailagenceA.textfrofield(),
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
                     FirebaseFirestore.instance.collection('AssuranceA').add({
                      'nom': nomassuranceA.value,
                      'num_contrat': numcontratA.value,
                      'num_carte_verte': numcarteverteA.value,
                      'du': dateinput.text,
                      'au': dateinput.text,
                      'agence': agenceA.value,
                      'nom_agence': nomagence.value,
                      'adresse': adresseagenceA.value,
                      'pays': paysagenceA.value,
                      'telephone': telephoneagenceA.value,
                      'email': emailagenceA.value,
                      'prise_encharge': selected.toString(),
                    }); 
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddConducteurA()));
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
