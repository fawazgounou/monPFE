import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addassur%C3%A9A.dart';
import 'package:insertion_bd/screens/VehiculB/addvehiculB.dart';
import 'package:uuid/uuid.dart';

import '../home/home.dart';

class TransitionB extends StatefulWidget {
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
  var assuranceB;
  var conducteurB;
  var observB;
  var photoB;
  var arriereB;
  var avantB;
  var droiteB;
  var gaucheB;
  var hautB;
  var circonstanceB;
  var signatureB;
  var imagesignatureB;
  var croquisA_B;
  var imagescroquiA_B;

  TransitionB(
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
      this.assureB,
      this.assuranceB,
      this.conducteurB,
      this.observB,
      this.photoB,
      this.arriereB,
      this.avantB,
      this.droiteB,
      this.gaucheB,
      this.hautB,
      this.circonstanceB,
      this.signatureB,
      this.imagesignatureB,
      this.croquisA_B,
      this.imagescroquiA_B})
      : super(key: key);

  @override
  State<TransitionB> createState() => _TransitionBState();
}

class _TransitionBState extends State<TransitionB> {
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
                        'CroquisA': widget.imagescroquiA_B[1],
                        'SignatureA': widget.imagesignature[1],
                        'SignatureB': widget.imagesignatureB[1],
                        'MarqueB': widget.vehiculeB[1],
                        'Numero_immatriculationB': widget.vehiculeB[2],
                        'Pays_immatriculationB': widget.vehiculeB[3],
                        'NomASB': widget.assureB[1],
                        'PrenomASB': widget.assureB[2],
                        'AdresseASB': widget.assureB[3],
                        'Code_PostalASB': widget.assureB[4],
                        'TéléphoneASSB': widget.assureB[5],
                        'EmailASB': widget.assureB[6],
                        'NomB': widget.assuranceB[1],
                        'num_contratB': widget.assuranceB[2],
                        'num_carte_verteB': widget.assuranceB[3],
                        'duB': widget.assuranceB[4],
                        'auB': widget.assuranceB[5],
                        'agenceB': widget.assuranceB[6],
                        'nom_agenceB': widget.assuranceB[7],
                        'adresseB': widget.assuranceB[8],
                        'paysB': widget.assuranceB[9],
                        'telephoneAB': widget.assuranceB[10],
                        'emailB': widget.assuranceB[11],
                        'prise_enchargeB': widget.assuranceB[12],
                        'NomCB': widget.conducteurB[1],
                        'PrenomCB': widget.conducteurB[2],
                        'AdresseCB': widget.conducteurB[3],
                        'date_naissanceCB': widget.conducteurB[4],
                        'paysCB': widget.conducteurB[5],
                        'telephoneCB': widget.conducteurB[6],
                        'emailCB': widget.conducteurB[7],
                        'num_permisCB': widget.conducteurB[8],
                        'categorieCB': widget.conducteurB[9],
                        'fin_valide_permisCB': widget.conducteurB[10],
                        'DétailleCB': widget.observB[1],
                        'DescriptionCB': widget.observB[2],
                        'CirconstanceCB': widget.circonstanceB[1],
                      });

                      FirebaseFirestore.instance
                          .collection('User')
                          .doc(widget.assuranceB[1])
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
                        'MarqueVB': widget.vehiculeA[1],
                        'Numero_immatriculationVB': widget.vehiculeA[2],
                        'Pays_immatriculationVB': widget.vehiculeA[3],
                        'NomASB': widget.assureA[1],
                        'PrenomASB': widget.assureA[2],
                        'AdresseASB': widget.assureA[3],
                        'Code_PostalASB': widget.assureA[4],
                        'TéléphoneAS': widget.assureA[5],
                        'EmailASB': widget.assureA[6],
                        'NomAB': widget.assuranceA[1],
                        'num_contratB': widget.assuranceA[2],
                        'num_carte_verteB': widget.assuranceA[3],
                        'duB': widget.assuranceA[4],
                        'auB': widget.assuranceA[5],
                        'agenceB': widget.assuranceA[6],
                        'nom_agenceB': widget.assuranceA[7],
                        'adresseB': widget.assuranceA[8],
                        'paysB': widget.assuranceA[9],
                        'telephoneAB': widget.assuranceA[10],
                        'emailB': widget.assuranceA[11],
                        'prise_enchargeB': widget.assuranceA[12],
                        'NomCB': widget.conductA[1],
                        'PrenomCB': widget.conductA[2],
                        'AdresseCB': widget.conductA[3],
                        'date_naissanceCB': widget.conductA[4],
                        'paysCB': widget.conductA[5],
                        'telephoneCB': widget.conductA[6],
                        'emailCB': widget.conductA[7],
                        'num_permisCB': widget.conductA[8],
                        'categorieCB': widget.conductA[9],
                        'fin_valide_permisCB': widget.conductA[10],
                        'DétailleB': widget.observ[1],
                        'DescriptionB': widget.observ[2],
                        'CirconstanceB': widget.circonstanceA[1],
                        'MarqueV': widget.vehiculeB[1],
                        'Numero_immatriculationV': widget.vehiculeB[2],
                        'Pays_immatriculationV': widget.vehiculeB[3],
                        'NomAS': widget.assureB[1],
                        'PrenomAS': widget.assureB[2],
                        'AdresseAS': widget.assureB[3],
                        'Code_PostalAS': widget.assureB[4],
                        'TéléphoneASS': widget.assureB[5],
                        'EmailAS': widget.assureB[6],
                        'Nom': widget.assuranceB[1],
                        'num_contrat': widget.assuranceB[2],
                        'num_carte_verte': widget.assuranceB[3],
                        'du': widget.assuranceB[4],
                        'au': widget.assuranceB[5],
                        'agence': widget.assuranceB[6],
                        'nom_agence': widget.assuranceB[7],
                        'adresse': widget.assuranceB[8],
                        'pays': widget.assuranceB[9],
                        'telephone': widget.assuranceB[10],
                        'email': widget.assuranceB[11],
                        'prise_encharge': widget.assuranceB[12],
                        'NomC': widget.conducteurB[1],
                        'PrenomC': widget.conducteurB[2],
                        'AdresseC': widget.conducteurB[3],
                        'date_naissanceC': widget.conducteurB[4],
                        'paysC': widget.conducteurB[5],
                        'telephoneC': widget.conducteurB[6],
                        'emailC': widget.conducteurB[7],
                        'num_permisC': widget.conducteurB[8],
                        'categorieC': widget.conducteurB[9],
                        'fin_valide_permisC': widget.conducteurB[10],
                        'Détaille': widget.observB[1],
                        'Description': widget.observB[2],
                        'Circonstance': widget.circonstanceB[1],
                        'CroquisA': widget.imagescroquiA_B[1],
                        'SignatureA': widget.imagesignature[1],
                        'SignatureB': widget.imagesignatureB[1],
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
