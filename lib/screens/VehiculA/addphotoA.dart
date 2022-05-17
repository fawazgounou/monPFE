import 'package:flutter/material.dart';
import 'package:insertion_bd/screens/VehiculA/Choc_photo/Arriere.dart';
import 'package:insertion_bd/screens/VehiculA/Choc_photo/Avant.dart';
import 'package:insertion_bd/screens/VehiculA/Choc_photo/CoteDroit.dart';
import 'package:insertion_bd/screens/VehiculA/Choc_photo/CoteGauche.dart';
import 'package:insertion_bd/screens/VehiculA/Choc_photo/Haut.dart';

import 'package:insertion_bd/screens/VehiculA/addcirconstanceA.dart';

import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

class AddPhotoA extends StatefulWidget {
  var Sin;
  var Temoin;
  var blesse;
  var vehiculeA;
  var assureA;
  var assuranceA;
  var conductA;
  var observ;
  AddPhotoA(
      {Key? key,
      this.Sin,
      this.Temoin,
      this.blesse,
      this.vehiculeA,
      this.assureA,
      this.assuranceA,
      this.conductA,
      this.observ})
      : super(key: key);

  @override
  State<AddPhotoA> createState() => _AddPhotoAState();
}

class _AddPhotoAState extends State<AddPhotoA> {
  var photo = [];
  var uuid = Uuid();

  final _key = GlobalKey<FormState>();
  List<Asset> images = <Asset>[];

  String value = '';
  final TextEditingController txt = TextEditingController();

  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  void requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    var status1 = await Permission.camera.status;
    if (!status.isGranted) {
      await Permission.camera.request();
    }
    var status2 = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }
  }

  Future<void> loadAssets(bool val) async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 200,
        enableCamera: val,
        selectedAssets: images,
        cupertinoOptions: const CupertinoOptions(takePhotoIcon: ""),
        materialOptions: const MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Monra Fawaz",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Indications des Chocs",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          const Text(
                            'Avant',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                            child: ElevatedButton(
                              onPressed: () {
                                photo = [uuid.v1()];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddAvantA(
                                              Sin: widget.Sin,
                                              Temoin: widget.Temoin,
                                              blesse: widget.blesse,
                                              vehiculeA: widget.vehiculeA,
                                              assureA: widget.assureA,
                                              assuranceA: widget.assuranceA,
                                              conductA: widget.conductA,
                                              observ: widget.observ,
                                              photo: photo,
                                            )));
                              },
                              child: Image.asset(
                                'assets/image/avant.jpg',
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Coté Droite',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                            child: ElevatedButton(
                              onPressed: () {
                                photo = [uuid.v1()];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CoteDroitA(
                                              Sin: widget.Sin,
                                              Temoin: widget.Temoin,
                                              blesse: widget.blesse,
                                              vehiculeA: widget.vehiculeA,
                                              assureA: widget.assureA,
                                              assuranceA: widget.assuranceA,
                                              conductA: widget.conductA,
                                              observ: widget.observ,
                                              photo: photo,
                                            )));
                              },
                              child: Image.asset(
                                'assets/image/coté_droite.jpg',
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Coté Gauche',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                            child: ElevatedButton(
                              onPressed: () {
                                photo = [uuid.v1()];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CoteGaucheA(
                                              Sin: widget.Sin,
                                              Temoin: widget.Temoin,
                                              blesse: widget.blesse,
                                              vehiculeA: widget.vehiculeA,
                                              assureA: widget.assureA,
                                              assuranceA: widget.assuranceA,
                                              conductA: widget.conductA,
                                              observ: widget.observ,
                                              photo: photo,
                                            )));
                              },
                              child: Image.asset(
                                'assets/image/coté_droite.jpg',
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      flex: 1,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Arrière',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                            child: ElevatedButton(
                              onPressed: () {
                                photo = [uuid.v1()];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ArrierevA(
                                              Sin: widget.Sin,
                                              Temoin: widget.Temoin,
                                              blesse: widget.blesse,
                                              vehiculeA: widget.vehiculeA,
                                              assureA: widget.assureA,
                                              assuranceA: widget.assuranceA,
                                              conductA: widget.conductA,
                                              observ: widget.observ,
                                              photo: photo,
                                            )));
                              },
                              child: Image.asset(
                                'assets/image/arriere.jpg',
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            'Haut',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                            child: ElevatedButton(
                              onPressed: () {
                                photo = [uuid.v1()];
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HautA(
                                              Sin: widget.Sin,
                                              Temoin: widget.Temoin,
                                              blesse: widget.blesse,
                                              vehiculeA: widget.vehiculeA,
                                              assureA: widget.assureA,
                                              assuranceA: widget.assuranceA,
                                              conductA: widget.conductA,
                                              observ: widget.observ,
                                              photo: photo,
                                            )));
                              },
                              child: Image.asset(
                                'assets/image/haut.jpg',
                                height: 200,
                                width: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      flex: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
