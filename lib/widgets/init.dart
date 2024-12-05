// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ged_app/core/themes/theme_images.dart';
import '../main.dart';

class InitializationPage extends StatefulWidget {
  const InitializationPage({super.key});

  @override
  State<InitializationPage> createState() => _InitializationPageState();
}

class _InitializationPageState extends State<InitializationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GED APP',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Init.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const MyApp();
          } else {
            return const SplashScreen();
          }
        },
      ),
    );
  }
}

class Init {
  static initialize() async {
    await _registerServices();
    await _loadSettings();
  }

  static _registerServices() async {
    print("debut chargement service");
    await Future.delayed(const Duration(seconds: 2));
  }

  static _loadSettings() async {
    print("debut chargement setting");
    await Future.delayed(const Duration(seconds: 2));
    print("debut chargement");
    print("fin chargement setting");
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Images.back02), fit: BoxFit.cover),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Colors.transparent,
                Colors.transparent,
                Colors.transparent,
                Colors.black26,
                Colors.black38,
                Colors.black45,
                Colors.black54,
                Colors.black87,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            ),
          ),
          const Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.2,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      "GED APP",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontFamily: 'Aller',
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
