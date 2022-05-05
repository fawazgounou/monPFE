import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



import 'package:insertion_bd/screens/VehiculB/SignatureB/addsignatureB.dart';

class AddCirconstanceB extends StatefulWidget {
  const AddCirconstanceB({Key? key}) : super(key: key);

  @override
  State<AddCirconstanceB> createState() => _AddCirconstanceBState();
}

class _AddCirconstanceBState extends State<AddCirconstanceB> {
  bool checkbox1 = false;

  List<Map<String, dynamic>> data = [
    {
      'title': "En Stationnement ou Arrêt",
      'value': false,
    },
    {
      'title': "Quittait stationnement ou Ouvrait une portière",
      'value': false,
    },
    {
      'title': "Prenait un stationnement",
      'value': false,
    },
    {
      'title': "Sortait d'un parking, d'un lieu privé, d'un chemin de terre",
      'value': false,
    },
    {
      'title': "S’engageait sur une place à sens giratoire",
      'value': false,
    },
    {
      'title': "Roulait sur une place à sens giratoire",
      'value': false,
    },
    {
      'title':
          "Heurtait à l'arrière en roulant dans le mm sens et sur une même file",
      'value': false,
    },
    {
      'title': "Roulait dans le mm sens et sur une file différente",
      'value': false,
    },
    {
      'title': "Changeait de file",
      'value': false,
    },
    {
      'title': "Doublait",
      'value': false,
    },
    {
      'title': "Virait à droite",
      'value': false,
    },
    {
      'title': "Virait à gauche",
      'value': false,
    },
    {
      'title': "Reculait",
      'value': false,
    },
    {
      'title':
          "Empiétait sur une voie réservée à la circulation en sens inverse",
      'value': false,
    },
    {
      'title': "Venait de droite (dans un carrefour)",
      'value': false,
    },
    {
      'title': "N’avait pas observé un signal de priorité",
      'value': false,
    },
    {
      'title': "N’avait pas observé un feu rouge",
      'value': false,
    },
    {
      'title': "Ma situation ne correspond à rien",
      'value': false,
    },
  ];

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CIRCONSTANCE A"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              " Mettre une croix dans chacune des cases utiles pour preciser le croquis",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Form(
              key: _key,
              child: Container(
                height: 550,
                width: 400,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CheckboxListTile(
                        tileColor: Colors.teal,
                        activeColor: Colors.redAccent,
                        title: Text(
                          data[index]['title'].toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        value: data[index]['value'],
                        onChanged: (value) {
                          setState(() {
                            data[index]['value'] = value!;
                          });
                        });
                  },
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                 FirebaseFirestore.instance.collection('CirconstanceB').add({
                  'circonstance': data.toString(),
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignaturePageB()));
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
    );
  }
}
