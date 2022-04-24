import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zq/reusable/reuseable_component.dart';
import 'package:zq/screens/home_screen.dart';
import 'package:zq/utils/colors_utils.dart';
import '../model/model.dart';
import '../shared_preference.dart';
import 'camscanner.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("031B88"),
              hexStringToColor("6096FD"),
              hexStringToColor("AAB6FB"),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
                    child: Column(children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      reusableTextField("UserName", Icons.person_outline, false,
                          _userNameTextController),
                      const SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Email", Icons.person_outline, false,
                          _emailTextController),
                      const SizedBox(
                        height: 20,
                      ),
                      reusableTextField("Password", Icons.lock_outlined, true,
                          _passwordTextController),
                      const SizedBox(
                        height: 20,
                      ),
                      firebaseUIButton(context, "Sign Up", () {
                        if (formKey.currentState != null) {
                          formKey.currentState!.validate();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CamScanner()));
                        }
                        userRegister(
                            password: _passwordTextController.text,
                            email: _emailTextController.text,
                            name: _userNameTextController.text);

                        print("Created New Account");
                      }),
                    ])))));
  }
}
