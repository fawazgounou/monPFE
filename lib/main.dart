import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insertion_bd/screens/VehiculA/addassuranceA.dart';
import 'package:insertion_bd/screens/VehiculA/addcirconstanceA.dart';
import 'package:insertion_bd/screens/VehiculA/transitionA.dart';
import 'package:insertion_bd/screens/home/addblesse.dart';
import 'package:insertion_bd/screens/home/addsinistre.dart';
import 'package:insertion_bd/screens/home/addtemoin.dart';
import 'package:insertion_bd/screens/home/home.dart';
import 'package:insertion_bd/screens/home/option_1_2.dart';

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
      routes: {'temoin':(context)=> AddTemoins(),
      'blesse':(context)=> AddBlesse(),
      },
      theme: ThemeData(),
      title: 'Déclare ton Sinistre',
      home: const Home(),
    );
  }
}
