import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insertion_bd/Model/model.dart';

import 'package:insertion_bd/screens/VehiculA/addcirconstanceA.dart';
import 'package:insertion_bd/screens/VehiculA/transitionA.dart';

import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

import '../SignatureA1/addsignatureA1.dart';
import '../transitionA1.dart';

class AddCroquis1 extends StatefulWidget {
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
  AddCroquis1(
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
      this.croquis})
      : super(key: key);

  @override
  State<AddCroquis1> createState() => _AddCroquis1State();
}

class _AddCroquis1State extends State<AddCroquis1> {
  var uuid = Uuid();
  var imagecroquis = [];
  final _key = GlobalKey<FormState>();
  List<Asset> images = <Asset>[];

  String value = '';
  final TextEditingController txt = TextEditingController();

  get imageRef => null;
  String _fullName = '';

  String? url;
  @override
  void initState() {
    requestPermission();
    super.initState();
  }

  File? _pickedImage;

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Croquis du Sinistre",
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                _pickImageGallery();
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                shadowColor: Colors.white.withOpacity(.7),
                              ),
                              child: const Text(
                                "Gallerie",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 55,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 400,
                  decoration: _pickedImage == null
                      ? const BoxDecoration(color: Colors.white)
                      : BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(_pickedImage!),
                              fit: BoxFit.cover)),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () async {
          if (_pickedImage != null) {
            final ref = FirebaseStorage.instance
                .ref()
                .child('Imagecroquis')
                .child(_fullName + '.jpg');
            await ref.putFile(_pickedImage!);
            url = await ref.getDownloadURL();

            imagecroquis = [uuid.v1(), url, _fullName];
      
          }

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SignaturePageA1(
                        Sin: widget.Sin,
                        Temoin: widget.Temoin,
                        blesse: widget.blesse,
                        vehiculeA: widget.vehiculeA,
                        assureA: widget.assureA,
                        assuranceA: widget.assuranceA,
                        conductA: widget.conductA,
                        observ: widget.observ,
                        photo: widget.photo,
                        arriere: widget.arriere,
                        avant: widget.avant,
                        droit: widget.droit,
                        gauche: widget.gauche,
                        hautA: widget.hautA,
                        circonstanceA: widget.circonstanceA,
                        croquis: widget.croquis,
                        imagecroquis: imagecroquis,
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
