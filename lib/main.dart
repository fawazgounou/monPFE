import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insertion_bd/screens/1_VehiculA/addassuranceA1.dart';
import 'package:insertion_bd/screens/1_VehiculA/addphotoA1.dart';
import 'package:insertion_bd/screens/VehiculA/transitionA.dart';
import 'package:insertion_bd/screens/VehiculB/transitionB.dart';
import 'package:insertion_bd/screens/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      title: 'Déclare ton Sinistre',
      home: Home (),
    );
  }
}
