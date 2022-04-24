import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? name;
  String? email;
  String? iId;


  UserModel({this.name, this.email, this.iId,});

  UserModel.fromJson(dynamic json) {
    email = json['email'];
    name = json['name'];
    iId = json['iId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'iId': iId,
    };
  }
}






