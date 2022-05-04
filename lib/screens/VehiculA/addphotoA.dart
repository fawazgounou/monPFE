import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insertion_bd/screens/VehiculA/SignatureA/addsignatureA.dart';
import 'package:insertion_bd/screens/VehiculA/addcirconstanceA.dart';
import 'package:insertion_bd/screens/VehiculA/addobservationA.dart';

import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class AddPhotoA extends StatefulWidget {
  const AddPhotoA({Key? key}) : super(key: key);

  @override
  State<AddPhotoA> createState() => _AddPhotoAState();
}

class _AddPhotoAState extends State<AddPhotoA> {
  final _key = GlobalKey<FormState>();
  List<Asset> images = <Asset>[];

  String value = '';
  final TextEditingController txt = TextEditingController();

  get imageRef => null;

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

  FilePickerResult? resultList =
      FilePicker.plateform.pickFiles(type: FileType.image);

  Future<void> loadAssets(bool val) async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      /*  final ref = FirebaseStorage.instance
          .ref()
          .child('choc_image')
          .child(_fullName + '.jpg');
      await ref.putFile(_pickedImage);
      url = await ref.getDownloadURL(); */

      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
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

    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  Future<void> pickimage() async {
    FilePickerResult? resultList =
        FilePicker.plateform.pickFiles(type: FileType.image);
    if (resultList != null) {
      File file = File(resultList.);

      DocumentReference imageDoc = await FirebaseFirestore.instance.collection('image').add({
        'url':''
      });
      FirebaseStorage.instance.ref(imageDoc.id + '.jpg');
      await imageRef.putFile(file);
      var imageURL = await imageRef.getDownloadURL();

      imageDoc.update({
        'url':imageURL,
      });
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Indication Choc",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _key,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  " Point de choc Véhicule A",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              loadAssets(true);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              shadowColor: Colors.white.withOpacity(.7),
                            ),
                            child: const Text(
                              "Camera",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              loadAssets(true);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              shadowColor: Colors.white.withOpacity(.7),
                            ),
                            child: const Text(
                              "Photos",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
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
                  child: Column(
                    children: List.generate(images.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AssetThumb(
                          asset: images[index],
                          width: 300,
                          height: 400,
                          quality: 100,
                        ),
                      );
                    }),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection('PhotosA').add({});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddCirconstanceA()));
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    shadowColor: Colors.white.withOpacity(.7),
                  ),
                  child: const Text(
                    "Suivant",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FileType {
  static var image;
}

class FilePicker {
  static var plateform;
}

class FilePickerResult {}
