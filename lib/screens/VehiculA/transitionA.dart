import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insertion_bd/Model/model.dart';
import 'package:insertion_bd/Model/sinistre_notifier.dart';
import 'package:insertion_bd/screens/VehiculA/addassur%C3%A9A.dart';
import 'package:insertion_bd/screens/VehiculB/addvehiculB.dart';
import 'package:insertion_bd/Model/model.dart';
import 'package:insertion_bd/screens/home/addsinistre.dart';
import 'package:provider/provider.dart';

class TransitionA extends StatefulWidget {
  var Sin;
  var Temoin;
  var blesse;
  var vehiculeA;
  var assureA;
  var assuranceA;
  var conductA;
  var observ;
  var photo;

  var circonstanceA;
  var signature;
  var imagesignature;
  TransitionA(
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
      this.circonstanceA,
      this.signature,
      this.imagesignature})
      : super(key: key);

  @override
  State<TransitionA> createState() => _TransitionAState();
}

class _TransitionAState extends State<TransitionA> {
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddVehiculB(
                      Sin: widget.Sin,
                      Temoin: widget.Temoin,
                      blesse: widget.blesse,
                      vehiculeA: widget.vehiculeA,
                      assureA: widget.assureA,
                      assuranceA: widget.assuranceA,
                      conductA: widget.conductA,
                      observ: widget.observ,
                      photo: widget.photo,
                      circonstanceA: widget.circonstanceA,
                      signature: widget.signature,
                      imagesignature: widget.imagesignature,
                      transA: transA)));
        },
        child: Container(
          height: 70.0,
          width: double.infinity,
          color: Colors.blue,
          child: const Text(
            "Saisir les informations du véhicule B",
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
