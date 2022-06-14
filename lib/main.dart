import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:insertion_bd/screens/1_VehiculA/Choc_photo1/Arriere1.dart';
import 'package:insertion_bd/screens/1_VehiculA/addassuranceA1.dart';
import 'package:insertion_bd/screens/1_VehiculA/addphotoA1.dart';
import 'package:insertion_bd/screens/1_VehiculA/transitionA1.dart';

import 'package:insertion_bd/screens/home/home.dart';
import 'package:insertion_bd/screens/home/option_1_2.dart';

import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';

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
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Lottie.network(
            'https://assets3.lottiefiles.com/packages/lf20_2yyeslc6.json'),
        backgroundColor: Colors.blue,
        duration: 1000,
        splashIconSize: 1000,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: Duration(seconds: 3),
        nextScreen: Home());
  }
}
