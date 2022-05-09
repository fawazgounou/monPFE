import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/addassur%C3%A9A.dart';
import 'package:insertion_bd/screens/VehiculB/addvehiculB.dart';

class TransitionA1 extends StatefulWidget {
  const TransitionA1({Key? key}) : super(key: key);

  @override
  State<TransitionA1> createState() => _TransitionA1State();
}

class _TransitionA1State extends State<TransitionA1> {
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
