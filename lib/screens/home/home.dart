import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/home/addsinistre.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

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
                padding: EdgeInsets.only(top: 50 ),
                child: Text('Constat Amiable Automobile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center),
              ),
              const SizedBox(
                height: 50,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/image/sinistre2.jpg',
                  height: 200,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'DECLARE TON SINISTRE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              FlatButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddSinistre()));
                  },
                  icon: Icon(Icons.add, color: Colors.white),
                  label: Text(
                    "Ajouter un Sinistre",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.lightBlueAccent),
            ],
          ),
        ),
      ),
    ));
  }
}
