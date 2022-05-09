import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/home/addtemoin.dart';
import 'package:insertion_bd/screens/home_1/addtemoin1.dart';
import 'package:multiselect/multiselect.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/customTextField.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class AddSinistre1 extends StatefulWidget {
  const AddSinistre1({Key? key}) : super(key: key);

  @override
  State<AddSinistre1> createState() => _AddSinistre1State();
}

class _AddSinistre1State extends State<AddSinistre1> {
  CustomTextField lieu = CustomTextField(
      placeholder: "Entrer le Lieu", title: "Lieu", line: 1, initialValue: '');

  final _key = GlobalKey<FormState>();

  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = "";
    timeinput.text = "";
    super.initState();
  }

  String location = 'localisation';
  String Adresse = 'Géo Localisez-vous';
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  Future<void> GetAddresseFromLatLong(Position position) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemark);
    Placemark place = placemark[0];
    Adresse = '${place.street}, ${place.locality} ${place.country} ';
    setState(() {});
  }

  TextEditingController timeinput = TextEditingController();

  bool oui = false;
  bool non = false;
  bool _oui = false;
  bool _non = false;
  TimeOfDay selectedTime = TimeOfDay.now();
  String heure = "";
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    lieu.err = "Entrer le Lieu";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un Sinistre",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF6200EE)),
                        ),
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                        ),
                        labelStyle: TextStyle(color: Colors.black),
                        labelText: 'Entrer la Date'),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(251));

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
                          labelStyle:
                              TextStyle(color: Colors.black, fontSize: 19),
                        ),
                        readOnly: true,
                        onTap: () async {
                          _selectTime(context);

                          setState(() {
                            timeinput.text =
                                "${selectedTime.hour}:${selectedTime.minute}";
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
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
                MaterialPageRoute(builder: (context) => const AddTemoins1()));
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
