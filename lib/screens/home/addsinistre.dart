import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/home/addtemoin.dart';
import 'package:multiselect/multiselect.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
    super.initState();
  }

  final TextEditingController _txtTimeController = TextEditingController();
  final MaskTextInputFormatter timeMaskFormatter =
      MaskTextInputFormatter(mask: '##:##:##', filter: {"#": RegExp(r'[0-9]')});

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
                  "Nouveaux Sinistres",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextFormField(
                    controller: _txtTimeController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: false),
                    decoration: const InputDecoration(
                      hintText: '00:00:00',
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                    inputFormatters: <TextInputFormatter>[timeMaskFormatter],
                  ),
                ),
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
                      'heure_sinistre': _txtTimeController.text,
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
        ),
      ),
    );
  }
}
