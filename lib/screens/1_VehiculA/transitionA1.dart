import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
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
  var croquis;
  var imagecroquis;
  var signature;
  var imagesignature;
  TransitionA1({
    Key? key,
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
    this.croquis,
    this.imagecroquis,
    this.signature,
    this.imagesignature,
  }) : super(key: key);

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
                      FirebaseFirestore.instance
                          .collection('User')
                          .doc(widget.assuranceA[1])
                          .collection('Sinistre')
                          .doc(widget.Sin[0])
                          .set({
                        'Localisation': widget.Sin[1],
                        'date_Sinistre': widget.Sin[2],
                        'Heure_Sinistre': widget.Sin[3],
                        'Lieu': widget.Sin[4],
                        'blesse': widget.Sin[5],
                        'degats': widget.Sin[6],
                        'nomT': widget.Temoin[1],
                        'prenomT': widget.Temoin[2],
                        'AdresseT': widget.Temoin[3],
                        'TelephoneT': widget.Temoin[4],
                        'nomB': widget.blesse[1],
                        'prenomB': widget.blesse[2],
                        'AdresseB': widget.blesse[3],
                        'telephoneB': widget.blesse[4],
                        'ProfessionB': widget.blesse[5],
                        'SituationB': widget.blesse[6],
                        'CasqueB': widget.blesse[7],
                        'Centre_HospitalierB': widget.blesse[8],
                        'Nature_GravitéB': widget.blesse[9],
                        'MarqueV': widget.vehiculeA[1],
                        'Numero_immatriculationV': widget.vehiculeA[2],
                        'Pays_immatriculationV': widget.vehiculeA[3],
                        'NomAS': widget.assureA[1],
                        'PrenomAS': widget.assureA[2],
                        'AdresseAS': widget.assureA[3],
                        'Code_PostalAS': widget.assureA[4],
                        'TéléphoneAS': widget.assureA[5],
                        'EmailAS': widget.assureA[6],
                        'NomA': widget.assuranceA[1],
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
                        'NomC': widget.conductA[1],
                        'PrenomC': widget.conductA[2],
                        'AdresseC': widget.conductA[3],
                        'date_naissanceC': widget.conductA[4],
                        'paysC': widget.conductA[5],
                        'telephoneC': widget.conductA[6],
                        'emailC': widget.conductA[7],
                        'num_permisC': widget.conductA[8],
                        'categorieC': widget.conductA[9],
                        'fin_valide_permisC': widget.conductA[10],
                        'id_SignatureCAC': widget.signature[0],
                        'Détaille': widget.observ[1],
                        'Description': widget.observ[2],
                        'Circonstance': widget.circonstanceA[1],
                        'CroquisA': widget.imagecroquis[1],
                        'SignatureA': widget.imagesignature[1],
                        'imageArriereA': widget.arriere[1] ?? "",
                      /*  'imageAvantA': widget.avant[1]==null?"":widget.avant[1],
                         /* 'imageDroitA': widget.droit[1] ?? "",
                        'imageGaucheA': widget.gauche[1] ?? "",
                        'imageHautA': ""?? widget.hautA[1], */ */
                        'MarqueB': '  ',
                        'Numero_immatriculationB': '  ',
                        'Pays_immatriculationB': '  ',
                        'NomASB': '  ',
                        'PrenomASB': '  ',
                        'AdresseASB': '  ',
                        'Code_PostalASB': '  ',
                        'TéléphoneASSB': '  ',
                        'EmailASB': '  ',
                        'NomB': '  ',
                        'num_contratB': '  ',
                        'num_carte_verteB': '  ',
                        'duB': '  ',
                        'auB': '  ',
                        'agenceB': '  ',
                        'nom_agenceB': '  ',
                        'adresseB': '  ',
                        'paysB': '  ',
                        'telephoneAB': '  ',
                        'emailB': '  ',
                        'prise_enchargeB': '  ',
                        'NomCB': '  ',
                        'PrenomCB': '  ',
                        'AdresseCB': '  ',
                        'date_naissanceCB': '  ',
                        'paysCB': '  ',
                        'telephoneCB': '  ',
                        'emailCB': '  ',
                        'num_permisCB': '  ',
                        'categorieCB': '  ',
                        'fin_valide_permisCB': '  ',
                        'DétailleCB': '  ',
                        'DescriptionCB': '  ',
                        'CirconstanceCB': '  ',
                        'SignatureB': '  ',
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
