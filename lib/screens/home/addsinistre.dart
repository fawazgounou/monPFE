import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/home/addtemoin.dart';
import 'package:multiselect/multiselect.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../widgets/customTextField.dart';

class AddSinistre extends StatefulWidget {
  const AddSinistre({Key? key}) : super(key: key);

  @override
  State<AddSinistre> createState() => _AddSinistreState();
}

class _AddSinistreState extends State<AddSinistre> {
  CustomTextField localisation = CustomTextField(
      placeholder: "Entrer la Localisation",
      title: "Localisation",
      initialValue: '');
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

  TextEditingController timeinput = TextEditingController();
  //text editing controller for text field

  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    localisation.err = "veillez entrer la Localisation";
    lieu.err = "veillez entrer le Lieu";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter un Sinistre"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: TextField(
                controller: dateinput,
                decoration: const InputDecoration(
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
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 50,
              child: TextField(
                controller: timeinput, //editing controller of this TextField
                decoration: InputDecoration(
                    icon: Icon(Icons.timer), //icon of text field
                    labelText: "Enter Time" //label text of field
                    ),
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );

                  if (pickedTime != null) {
                    print(pickedTime.format(context)); //output 10:51 PM
                    DateTime parsedTime = DateFormat.jm()
                        .parse(pickedTime.format(context).toString());
                    //converting to DateTime so that we can further format on different pattern.
                    print(parsedTime); //output 1970-01-01 22:53:00.000
                    String formattedTime =
                        DateFormat('HH:mm:ss').format(parsedTime);
                    print(formattedTime); //output 14:59:00
                    //DateFormat() is from intl package, you can format the time on any pattern you need.

                    setState(() {
                      timeinput.text =
                          formattedTime; //set the value of text field.
                    });
                  } else {
                    print("Time is not selected");
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            /* Container(
                    padding: EdgeInsets.all(15),
                    height: 150,
                    child: Center(
                        child: )), */
            Container(),
            const SizedBox(
              height: 25,
            ),
            localisation.textfrofield(),
            const SizedBox(
              height: 20,
            ),
            lieu.textfrofield(),
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
              whenEmpty: 'Avec blesser meme leger',
            ),
            const SizedBox(
              height: 35,
            ),
            ElevatedButton(
              onPressed: () async {
                FirebaseFirestore.instance.collection('Sinistre').add({
                  'date_sinistre': dateinput.text,
                  /*  'heure_sinistre': _txtTimeController.text, */
                  'localisation_sinistre': localisation.value,
                  'lieu_sinistre': lieu.value,
                  'temoins_sinistre': selected.toString(),
                });

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddTemoins()));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                shadowColor: Colors.lightBlue.withOpacity(.7),
              ),
              child: const Text(
                "Suivant",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              /* shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    
                    color: Colors.lightBlue.withOpacity(.7) */
            ),
          ],
        ),
      ),
    );
  }
}
