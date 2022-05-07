import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/home/addsinistre.dart';
import 'package:insertion_bd/screens/home/localisation.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Localisation()));
                },
                child: Image.asset(
                  'assets/image/sinistre2.jpg',
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),

                /*  icon: Icon(Icons.add, color: Colors.white),
                  label: Text(
                    "Ajouter un Sinistre",
                    style: TextStyle(color: Colors.white),
                  ), */
              ),
              const SizedBox(
                height: 50,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'DECLARE TON SINISTRE',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
