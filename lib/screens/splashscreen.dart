import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zq/screens/signin_screen.dart';
import '../utils/colors_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const SigninScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("031B88"),
              hexStringToColor("6096FD"),
              hexStringToColor("AAB6FB"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Center(
                // ignore: prefer_const_literals_to_create_immutables
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                  Text('Welcome ',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1C2D40))),
                ]))));
  }
}
