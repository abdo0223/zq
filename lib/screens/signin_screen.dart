import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zq/reusable/reuseable_component.dart';
import 'package:zq/screens/resetpassword.dart';
import 'package:zq/screens/signupscreen.dart';
import 'package:zq/utils/colors_utils.dart';
import 'camscanner.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  var formkey=GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
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
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        20, MediaQuery.of(context).size.height * 0.2, 20, 0),
                    child: Column(children: <Widget>[
                      logoWidget("assets/images/logo.png"),
                      const SizedBox(
                        height: 30,
                      ),
                      reusableTextField("Email", Icons.person_outline,
                          false, _emailTextController),
                      const SizedBox(
                        height: 15,
                      ),
                      reusableTextField(" Password", Icons.lock_outline,
                          true, _passwordTextController),

                     const SizedBox(
                        height: 5,
                      ),
                      forgetPassword(context),
                      firebaseUIButton(context, "Login", (
                          ) {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CamScanner()));
                        }).onError((error,  stackTrace){
                          print("Error ${error.toString()}");
                        });
                      }),
                      signUpOption(),
                    ])
                )
            )
        )
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.white70)),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SignUpScreen()));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.white70),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  ResetPassword())),
      ),
    );
  }
}
