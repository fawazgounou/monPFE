import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insertion_bd/screens/VehiculA/addphotoA.dart';
import 'package:insertion_bd/screens/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blue,
        /* Color(0xFF3F0846) */
        /* fontFamily: 'lithos', */
      ),
      title: 'Déclare ton Sinistre',
      home: AddPhotoA(),
    );
  }
}
