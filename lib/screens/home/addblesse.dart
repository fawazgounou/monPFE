import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addvehiculA.dart';
import 'package:insertion_bd/widgets/customNumberField.dart';

import '../../widgets/customTextField.dart';

class AddBlesse extends StatefulWidget {
  const AddBlesse({Key? key}) : super(key: key);

  @override
  State<AddBlesse> createState() => _AddBlesseState();
}

class _AddBlesseState extends State<AddBlesse> {
  CustomTextField nomblesse = CustomTextField(
      placeholder: "Entrer le noms", title: "Nom Blessé(s)", initialValue: '');
  CustomTextField prenomblesse = CustomTextField(
      placeholder: "Entrer le Prenom",
      title: "Prénom Blessé(s)",
      initialValue: '');
  CustomTextField adresseblesse = CustomTextField(
      placeholder: "Entrer  Adresse",
      title: "Adresse Blessé(s)",
      initialValue: '');
  CustomNumberField telephone = CustomNumberField(
      placeholder: "Entrer le téléphone",
      title: "Téléphone Blessé(s)",
      initialValue: '');
  CustomTextField profession = CustomTextField(
      placeholder: "Entrer la profession",
      title: "Profession",
      initialValue: '');
  CustomTextField situation = CustomTextField(
      placeholder:
          "(conducteur, passager du vehicule A ou B, cycliste, piéton)",
      title: "Situation au moment de l'accident",
      initialValue: '');
  CustomTextField casqueceinture = CustomTextField(
      placeholder: "",
      title: "Portait-il de casque ou ceinture ?",
      initialValue: '');
  CustomTextField premiersoinslieu = CustomTextField(
      placeholder: "Entrer lieu hospitalisation",
      title: "1 Soins ou Hospitalisation",
      initialValue: '');
  CustomTextField gravitenature = CustomTextField(
      placeholder: "Entrer la nature et la gravité",
      title: "Nature et Gravité des Blessures",
      initialValue: '');

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    nomblesse.err = "veillez entrer le Nom";
    prenomblesse.err = "veillez entrer le Prénom";
    adresseblesse.err = " veillez entrer l'Adresse ";
    telephone.err = " veillez entrer le Téléphone";
    profession.err = " veillez entrer la Profession";
    situation.err = " veillez entrer la Situation ";
    casqueceinture.err = " veillez entrer repondre ";
    premiersoinslieu.err = " veillez entrer le Lieu du premier soin";
    gravitenature.err = " veillez entrer le niveau de blessure";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter des Blessés"),
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
                  "Nouveaux Blessés",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 25,
                ),
                nomblesse.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                prenomblesse.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                adresseblesse.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                telephone.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                profession.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                situation.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                casqueceinture.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                premiersoinslieu.textfrofield(),
                const SizedBox(
                  height: 20,
                ),
                gravitenature.textfrofield(),
                const SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                  onPressed: () async {
                  
                      FirebaseFirestore.instance.collection('Blesse').add({
                      'nom': nomblesse.value,
                      'prenom': prenomblesse.value,
                      'adresse': adresseblesse.value,
                      'telephone': telephone.value,
                      'profession': profession.value,
                       'situation': situation.value,
                      'casque': casqueceinture.value,
                      'centre_hospitalier': premiersoinslieu.value,
                      'nature_gravite': gravitenature.value,
                      }); 
                       
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: Colors.lightBlue.withOpacity(.7),
                  ),
                  child: const Text(
                    "Ajouter un Blessé",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddVehiculA()));
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
