import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:insertion_bd/screens/VehiculA/SignatureA/addsignatureA.dart';
import 'package:insertion_bd/screens/VehiculB/SignatureB/addsignatureA.dart';
import 'package:multiselect/multiselect.dart';
import 'package:uuid/uuid.dart';

class AddCirconstanceB extends StatefulWidget {
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
  var transA;
  var vehiculeB;
  var assureB;
  var assuranceB;
  var conducteurB;
  var observB;
  var photoB;

  AddCirconstanceB({
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
  }) : super(key: key);

  @override
  State<AddCirconstanceB> createState() => _AddCirconstanceBState();
}

class _AddCirconstanceBState extends State<AddCirconstanceB> {
  var uuid = Uuid();
  var circonstanceB = [];
  bool _1 = false;
  bool _2 = false;
  bool _3 = false;
  bool _4 = false;
  bool _5 = false;
  bool _6 = false;
  bool _7 = false;
  bool _8 = false;
  bool _9 = false;
  bool _10 = false;
  bool _11 = false;
  bool _12 = false;
  bool _13 = false;
  bool _14 = false;
  bool _15 = false;
  bool _16 = false;
  bool _17 = false;
  bool _18 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Circonstance B",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      'En Stationnement ou Arr??t',
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _1,
                      onChanged: (value) {
                        setState(() {
                          _1 = true;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "Quittait stationnement ou Ouvrait une porti??re",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _2,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = true;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "Prenait un stationnement",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _3,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = true;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "Sortait d'un parking, d'un lieu priv??, d'un chemin de terre",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _4,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = true;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "S???engageait sur une place ?? sens giratoire",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _5,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = true;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "Roulait sur une place ?? sens giratoire",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _6,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = true;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "Heurtait ?? l'arri??re en roulant dans le mm sens et sur une m??me file",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _7,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = true;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "Roulait dans le mm sens et sur une file diff??rente",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _8,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = true;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "Changeait de file",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _9,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = true;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "Doublait",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _10,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = true;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "Virait ?? droite",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _11,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = true;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "Virait ?? gauche",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _12,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = true;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "Reculait",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _13,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = true;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "Empi??tait sur une voie r??serv??e ?? la circulation en sens inverse",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _14,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = true;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "Venait de droite (dans un carrefour)",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _15,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = true;
                          _16 = false;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "N???avait pas observ?? un signal de priorit??",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _16,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = true;
                          _17 = false;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 4,
                    child: Text(
                      "N???avait pas observ?? un feu rouge",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _17,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = true;
                          _18 = false;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    flex: 18,
                    child: Text(
                      "Ma situation ne correspond ?? rien",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ), //Text
                  SizedBox(width: 10),

                  Expanded(
                    child: Checkbox(
                      value: _18,
                      onChanged: (value) {
                        setState(() {
                          _1 = false;
                          _2 = false;
                          _3 = false;
                          _4 = false;
                          _5 = false;
                          _6 = false;
                          _7 = false;
                          _8 = false;
                          _9 = false;
                          _10 = false;
                          _11 = false;
                          _12 = false;
                          _13 = false;
                          _14 = false;
                          _15 = false;
                          _16 = false;
                          _17 = false;
                          _18 = true;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          String index = '';

          if (_1 == true) {
            index = "En Stationnement ou Arr??t";
          }
          if (_2 == true) {
            index = "Quittait stationnement ou Ouvrait une porti??re";
          }
          if (_3 == true) {
            index = "Prenait un stationnement";
          }
          if (_4 == true) {
            index =
                "Sortait d'un parking, d'un lieu priv??, d'un chemin de terre";
          }
          if (_5 == true) {
            index = "S???engageait sur une place ?? sens giratoire";
          }
          if (_6 == true) {
            index = "Roulait sur une place ?? sens giratoire";
          }
          if (_7 == true) {
            index =
                "Heurtait ?? l'arri??re en roulant dans le mm sens et sur une m??me file";
          }
          if (_8 == true) {
            index = "Roulait dans le mm sens et sur une file diff??rente";
          }
          if (_9 == true) {
            index = "Changeait de file";
          }
          if (_10 == true) {
            index = "Doublait";
          }
          if (_11 == true) {
            index = "Virait ?? droite";
          }
          if (_12 == true) {
            index = "Virait ?? gauche";
          }
          if (_13 == true) {
            index = "Reculait";
          }
          if (_14 == true) {
            index =
                "Empi??tait sur une voie r??serv??e ?? la circulation en sens inverse";
          }
          if (_15 == true) {
            index = "Venait de droite (dans un carrefour)";
          }
          if (_16 == true) {
            index = "N???avait pas observ?? un signal de priorit??";
          }
          if (_17 == true) {
            index = "N???avait pas observ?? un feu rouge";
          }
          if (_18 == true) {
            index = "Ma situation ne correspond ?? rien";
          }

          circonstanceB = [
            uuid.v1(),
            index.toString(),
          ];

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SignaturePageB(
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
                        transA: widget.transA,
                        vehiculeB: widget.vehiculeB,
                        assureB: widget.assureB,
                        assuranceB: widget.assuranceB,
                        conducteurB: widget.conducteurB,
                        observB: widget.observB,
                        photoB: widget.photoB,
                        circonstanceB: circonstanceB,
                      )));
        },
        child: Container(
          height: 50.0,
          width: double.infinity,
          color: Colors.blue,
          child: const Text(
            "Suivant",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
