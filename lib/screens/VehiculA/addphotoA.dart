import 'package:flutter/material.dart';

import 'package:insertion_bd/screens/VehiculA/addcirconstanceA.dart';


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
                  " Point de choc Véhicul A",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 25,
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
                        const SizedBox(
                          height: 20,
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
                              "Photo",
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
                      //Asset asset =;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AssetThumb(
                          asset: images[index], //asset,
                          width: 300,
                          height: 400,
                        ),
                      );
                    }),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                   
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
