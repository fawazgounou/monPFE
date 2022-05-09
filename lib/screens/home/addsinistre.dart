import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/home/addtemoin.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/customTextField.dart';

class AddSinistre extends StatefulWidget {
  const AddSinistre({Key? key}) : super(key: key);

  @override
  State<AddSinistre> createState() => _AddSinistreState();
}

class _AddSinistreState extends State<AddSinistre> {
  CustomTextField lieu = CustomTextField(
      placeholder: "Entrer le Lieu", title: "Lieu", line: 1, initialValue: '');

  final _key = GlobalKey<FormState>();

  TextEditingController dateinput = TextEditingController();

  get err => null;
  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = "";
    super.initState();
  }

  TextEditingController timeinput = TextEditingController();

  bool oui = false;
  bool non = false;
  bool _oui = false;
  bool _non = false;

  @override
  Widget build(BuildContext context) {
    lieu.err = "Veuillez entrer le Lieu";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un Sinistre",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
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
                            labelStyle:
                                TextStyle(color: Colors.black, fontSize: 20),
                            labelText: 'Date'),
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
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                          child: TextFormField(
                        controller: timeinput,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Entrer l'Heure";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.timer,
                            color: Colors.black,
                          ),
                          labelText: "Heure",
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        readOnly: true,
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.now(),
                            context: context,
                          );

                          if (pickedTime != null) {
                            print(pickedTime.format(context));
                            DateTime parsedTime = Intl.withLocale(
                                'en',
                                () => new DateFormat("hh:mm").parse(
                                    (pickedTime.format(context).toString())));

                            print(parsedTime);
                            String formattedTime =
                                DateFormat('HH:mm:ss').format(parsedTime);
                            print(formattedTime);

                            setState(() {
                              timeinput.text = formattedTime;
                            });
                          } else {
                            print("Time is not selected");
                          }
                        },
                      )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: lieu.textfrofield(),
                      flex: 1,
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  " Blessé(s) même léger(s)",
                  style: TextStyle(color: Colors.black, fontSize: 17),
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
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Dégâts matériel à des véhicules autre que  A et B",
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
                            value: _oui,
                            onChanged: (value) {
                              setState(() {
                                _oui = true;
                                _non = false;
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
                            value: _non,
                            onChanged: (value) {
                              setState(() {
                                _oui = false;
                                _non = true;
                              });
                            },
                          ),
                          Text('NON')
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          if (_key.currentState!.validate()) {
            String index = '';
            String index2 = '';
            if (oui == true) {
              index = 'Oui';
            }
            if (non == true) {
              index = 'Non';
            }
            if (_oui == true) {
              index2 = 'Oui';
            }
            if (_non == true) {
              index2 = 'Non';
            }
            FirebaseFirestore.instance.collection('Sinistre').add({
              'date_sinistre': dateinput.text,
              'heure_sinistre': timeinput.text,
              'lieu_sinistre': lieu.value,
              'blesse': index.toString(),
              'degats': index2.toString(),
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddTemoins()));
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
