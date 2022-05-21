import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addconducteurA.dart';
import 'package:insertion_bd/screens/VehiculB/addconducteurB.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:multiselect/multiselect.dart';
import 'package:uuid/uuid.dart';

import '../../widgets/customTextField.dart';

class AddAssuranceB extends StatefulWidget {
  var Sin;
  var Temoin;
  var blesse;
  var vehiculeA;
  var assureA;
  var assuranceA;
  var conductA;
  var observ;
  var photo;
  var arriere;
  var avant;
  var droit;
  var gauche;
  var hautA;
  var circonstanceA;
  var signature;
  var imagesignature;
  var transA;
  var vehiculeB;
  var assureB;
  AddAssuranceB(
      {Key? key,
      this.Sin,
      this.Temoin,
      this.blesse,
      this.vehiculeA,
      this.assureA,
      this.assuranceA,
      this.conductA,
      this.observ,
      this.photo,
      this.arriere,
      this.avant,
      this.droit,
      this.gauche,
      this.hautA,
      this.circonstanceA,
      this.signature,
      this.imagesignature,
      this.transA,
      this.vehiculeB,
      this.assureB})
      : super(key: key);

  @override
  State<AddAssuranceB> createState() => _AddAssuranceBState();
}

class _AddAssuranceBState extends State<AddAssuranceB> {
  var uuid = Uuid();
  var assuranceB = [];

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
      title: " Bureau ou Courtier",
      initialValue: '');
  CustomTextField nomagence = CustomTextField(
      placeholder: "Nom Agence", title: "Nom", initialValue: '');
  CustomTextField adresseagenceB = CustomTextField(
      placeholder: "Adresse Agence", title: "Adresse", initialValue: '');
  CustomTextField paysagenceB = CustomTextField(
      placeholder: "Pays Agence", title: "Pays", initialValue: '');

  CustomTextField emailagenceB = CustomTextField(
      placeholder: "Email Agence", title: "Email", initialValue: '');
  TextEditingController dateinput = TextEditingController();
  TextEditingController dateinput2 = TextEditingController();
  final _key = GlobalKey<FormState>();
  final maskFormatter = MaskTextInputFormatter(mask: '+(###) ##-##-##-##');
  final TextEditingController numbertelephone = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    dateinput2.text = "";
    super.initState();
  }

  bool oui = false;
  bool non = false;
  String? _dropDownValue;
  @override
  Widget build(BuildContext context) {
    numcontratB.err = "Entrer le Numéro du contrat";
    numcarteverteB.err = "Entrer le Numéro de la carte verte'";
    agenceB.err = "Entrer te type D'agence";
    nomagence.err = "Entrer le Nom de l'agence";
    adresseagenceB.err = "Entrer l'Adresse l'agence'";
    paysagenceB.err = "Entrer le Pays Agence";

    emailagenceB.err = "Entrer le Téléphone";
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Société D'Assurance B",
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
                DropdownButton(
                  hint: _dropDownValue == null
                      ? Text('Choisissez votre Assureur')
                      : Text(
                          _dropDownValue!,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: TextStyle(color: Colors.black),
                  items: [
                    'NSIA BENIN',
                    'SUNU ASSURANCES VIE BENIN',
                    'ATLANTIQUE ASSURANCES BENIN',
                    'SAHAM ASSURANCE VIE',
                    'AFRICAINE VIE BENIN',
                    'SAHAM ASSURANCE'
                  ].map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        _dropDownValue = val.toString();
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: numcontratB.textfrofield(),
                      flex: 1,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: numcarteverteB.textfrofield(),
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
                                  dateinput2.text = formattedDate;
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
                      child: agenceB.textfrofield(),
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
                adresseagenceB.textfrofield(),
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
                      child: paysagenceB.textfrofield(),
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
                emailagenceB.textfrofield(),
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
            assuranceB = [
              uuid.v1(),
              _dropDownValue.toString(),
              numcontratB.value,
              numcarteverteB.value,
              dateinput.text,
              dateinput2.text,
              agenceB.value,
              nomagence.value,
              adresseagenceB.value,
              paysagenceB.value,
              numbertelephone.value,
              emailagenceB.value,
              index.toString(),
            ];
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddConducteurB(
                        Sin: widget.Sin,
                        Temoin: widget.Temoin,
                        blesse: widget.blesse,
                        vehiculeA: widget.vehiculeA,
                        assureA: widget.assureA,
                        assuranceA: widget.assuranceA,
                        conductA: widget.conductA,
                        observ: widget.observ,
                        photo: widget.photo,
                        arriere: widget.arriere,
                        avant: widget.avant,
                        droit: widget.droit,
                        gauche: widget.gauche,
                        hautA: widget.hautA,
                        circonstanceA: widget.circonstanceA,
                        signature: widget.signature,
                        imagesignature: widget.imagesignature,
                        transA: widget.transA,
                        vehiculeB: widget.vehiculeB,
                        assureB: widget.assureB,
                        assuranceB: assuranceB)));
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
