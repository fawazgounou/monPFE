import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:insertion_bd/screens/VehiculB/addvehiculB.dart';
import 'package:insertion_bd/screens/home/home.dart';

class TransitionA1 extends StatefulWidget {
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
  TransitionA1(
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
      this.imagesignature})
      : super(key: key);

  @override
  State<TransitionA1> createState() => _TransitionA1State();
}

class _TransitionA1State extends State<TransitionA1> {
  var transA = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text('CONSTAT AMIABLE AUTOMOBILE',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center),
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/image/bien1.jpg',
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ]),
                  child: ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('Temoins').add({
                        'id': widget.Temoin[0],
                        'nom': widget.Temoin[1],
                        'prenom': widget.Temoin[2],
                        'Adresse': widget.Temoin[3],
                        'Telephone': widget.Temoin[4],
                        'id_sinistre': widget.Sin[0],
                      });

                      FirebaseFirestore.instance.collection('Blesse').add({
                        'id': widget.blesse[0],
                        'nom': widget.blesse[1],
                        'prenom': widget.blesse[2],
                        'Adresse': widget.blesse[3],
                        'telephone': widget.blesse[4],
                        'Profession': widget.blesse[5],
                        'Situation': widget.blesse[6],
                        'Casque': widget.blesse[7],
                        'Centre_Hospitalier': widget.blesse[8],
                        'Nature_Gravité': widget.blesse[9],
                        'id_sinistre': widget.Sin[0],
                      });

                      FirebaseFirestore.instance.collection('VehiculeA').add({
                        'id_vehiculeA': widget.vehiculeA[0],
                        'Marque': widget.vehiculeA[1],
                        'Numero_immatriculation': widget.vehiculeA[2],
                        'Pays_immatriculation': widget.vehiculeA[3],
                      });

                      FirebaseFirestore.instance.collection('AssureA').add({
                        'id_AssuréA': widget.assureA[0],
                        'Nom': widget.assureA[1],
                        'Prenom': widget.assureA[2],
                        'Adresse': widget.assureA[3],
                        'Code_Postal': widget.assureA[4],
                        'Téléphone': widget.assureA[5],
                        'Email': widget.assureA[6],
                      });

                      FirebaseFirestore.instance.collection('AssuranceA').add({
                        'id_AssuranceA': widget.assuranceA[0],
                        'Nom': widget.assuranceA[1],
                        'num_contrat': widget.assuranceA[2],
                        'num_carte_verte': widget.assuranceA[3],
                        'du': widget.assuranceA[4],
                        'au': widget.assuranceA[5],
                        'agence': widget.assuranceA[6],
                        'nom_agence': widget.assuranceA[7],
                        'adresse': widget.assuranceA[8],
                        'pays': widget.assuranceA[9],
                        'telephone': widget.assuranceA[10],
                        'email': widget.assuranceA[11],
                        'prise_encharge': widget.assuranceA[12],
                      });

                      FirebaseFirestore.instance.collection('ConducteurA').add({
                        'id_conducteurA': widget.conductA[0],
                        'Nom': widget.conductA[1],
                        'Prenom': widget.conductA[2],
                        'Adresse': widget.conductA[3],
                        'date_naissance': widget.conductA[4],
                        'pays': widget.conductA[5],
                        'telephone': widget.conductA[6],
                        'email': widget.conductA[7],
                        'num_permis': widget.conductA[8],
                        'categorie': widget.conductA[9],
                        'fin_valide_permis': widget.conductA[10],
                        'id_SignatureCA': widget.signature[0],
                      });

                      FirebaseFirestore.instance
                          .collection('ObservationA')
                          .add({
                        'id_observationA': widget.observ[0],
                        'Détaille': widget.observ[1],
                        'Description': widget.observ[2],
                        'id_PhotoA': widget.photo[0],
                      });

                      FirebaseFirestore.instance
                          .collection('CirconstanceA')
                          .add({
                        'id_CirconstanceA': widget.circonstanceA[0],
                        'Circonstance': widget.circonstanceA[1],
                      });
                      FirebaseFirestore.instance.collection('Sinistre').add({
                        'id': widget.Sin[0],
                        'Localisation': widget.Sin[1],
                        'date_Sinistre': widget.Sin[2],
                        'Heure_Sinistre': widget.Sin[3],
                        'Lieu': widget.Sin[4],
                        'blesse': widget.Sin[5],
                        'degats': widget.Sin[6],
                        'id_vehiculeA': widget.vehiculeA[0],
                        'id_assuréA': widget.assureA[0],
                        'id_AssuranceA': widget.assuranceA[0],
                        'id_conducteurA': widget.conductA[0],
                        'id_observationA': widget.observ[0],
                        'id_CirconstanceA': widget.circonstanceA[0],
                      });
                    },
                    child: const Text(
                      'Sauvegarder',
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Home()));
        },
        child: Container(
          height: 70.0,
          width: double.infinity,
          color: Colors.blue,
          child: const Text(
            "Terminer",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
