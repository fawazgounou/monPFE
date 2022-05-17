import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addassur%C3%A9A.dart';
import 'package:insertion_bd/screens/VehiculB/addvehiculB.dart';
import 'package:uuid/uuid.dart';

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
      this.imagesignatureB})
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
                ElevatedButton(
                    onPressed: () {
                      FirebaseFirestore.instance.collection('Sinistre').add({
                        'id': widget.Sin[0],
                        'date_sinstre': widget.Sin[1],
                        'heure': widget.Sin[2],
                        'lieu': widget.Sin[3],
                        'blesse': widget.Sin[4],
                        'degats': widget.Sin[5]
                      });
                      FirebaseFirestore.instance.collection('Temoins').add({
                        'id': widget.Temoin[0],
                        'nom': widget.Temoin[1],
                        'prenom': widget.Temoin[2],
                        'lieu': widget.Temoin[3],
                        'blesse': widget.Temoin[4],
                        'degats': widget.Temoin[5]
                      });
                    },
                    child: const Text(
                      'Sauvegarder',
                      style: TextStyle(fontSize: 19),
                    )),
              ],
            ),
          ),
        ),
      ),
      /*  bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddVehiculB()));
        },
        child: Container(
          height: 70.0,
          width: double.infinity,
          color: Colors.blue,
          child: const Text(
            "Saisis les informations du véhicule B",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          alignment: Alignment.center,
        ),
      ), */
    );
  }
}
