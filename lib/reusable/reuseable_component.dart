import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/model.dart';
import '../shared_preference.dart';

var uId = CacheHelper.getSaved(key: 'uId');

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 250,
    height: 250,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white70,
      ),
      labelText: text,
      labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.white.withOpacity(0.3),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container firebaseUIButton(BuildContext context, String title, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

userRegister({
  required String password,
  required String email,
  required String name,
}) {
  FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((value) {
    /*  CacheHelper.setSaved(value: value.user!.uid, key: 'uId')
        .then((value) async {
      uId = CacheHelper.getSaved(key: 'uId');
    }); */
    userCreate(email: email, name: name, uId: value.user!.uid);
  }).catchError((onError) {
    print(onError);
  });
}

userCreate({
  required String email,
  required String name,
  required String uId,
}) {
  UserModel model = UserModel(
    email: email,
    iId: uId,
    name: name,
  );
  FirebaseFirestore.instance
      .collection('users')
      .doc(model.iId)
      .set(model.toMap())
      .then((value) {
    print('value');
    getUserData();
  }).catchError((onError) {
    print(onError.toString());
  });
}

Future<void> userLogin(
    {required String email, required String password}) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password)
      .then((value) async {
    CacheHelper.setSaved(value: value.user!.uid, key: 'uId')
        .then((value) async {
      uId = CacheHelper.getSaved(key: 'uId');
    });
    // getUserData();
  }).onError((error, stackTrace) {
    String onError = 'Some thing went wrong please call developer.';
    print(error);
  });
}

UserModel? userModel;
bool isGetUserDataNull = true;

Future<void> getUserData() async {
  if (uId != null) {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      isGetUserDataNull = false;
      print(value.data().toString());
      userModel = UserModel.fromJson(value.data());
    }).catchError((onError) {
      print(onError);
    });
  }
}
