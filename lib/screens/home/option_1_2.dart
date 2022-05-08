import 'package:flutter/material.dart';

import 'package:insertion_bd/screens/home/localisation.dart';

class ChoixOption extends StatefulWidget {
  const ChoixOption({Key? key}) : super(key: key);

  @override
  State<ChoixOption> createState() => _ChoixOptionState();
}

class _ChoixOptionState extends State<ChoixOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Saisie du contrat",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Text('Sélctionnez le mode de saisie',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Localisation()));
                          },
                          child: Image.asset(
                            'assets/image/A.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Localisation()));
                            },
                            child: Text("2 Conducteur")),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Localisation()));
                          },
                          child: Image.asset(
                            'assets/image/B.jpg',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Localisation()));
                            },
                            child: Text("1 Conducteur")),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
