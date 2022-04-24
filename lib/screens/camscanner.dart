import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class CamScanner extends StatefulWidget {
  const CamScanner({Key? key}) : super(key: key);
  @override
  State<CamScanner> createState() => _CamScannerState();
}

class _CamScannerState extends State<CamScanner> {
  var qrstr = "scan it";
  var name;
  String? email;
  String? uid;
  Future getData() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      name = value.data()!['name'];
      email = value.data()!['email'];
    });
  }

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async {
      await getData();
    });

    super.initState();
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode("#ff6666", "cancel", true, ScanMode.QR)
          .then((value) {
        setState(() {
          qrstr = value;
        });
      });
    } catch (e) {
      setState(() {
        qrstr = 'enable to read this';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: 65,
          leading: const Icon(
            Icons.home,
            color: Color(0xff1C2D40),
          ),
          title: const Center(
              child: Text(
            'Attendity',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff1C2D40),
                fontSize: 25),
          )
              //Image.asset('assets/images/1.png', fit: BoxFit.cover),
              )),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color(0xff1C2D40),
                    child: Text(
                      'R',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$email",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Text(
                'Welcome to your class',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30.0,
              ),
              //   Hero(tag: 'Attending', child: Image.asset('assets/images/2.png'),
              //  ),
              const SizedBox(
                height: 70,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 55,
                  width: 240,
                  child: RaisedButton(
                    //  onPressed: (){},
                    child: Row(
                      children: const [
                        Icon(
                          Icons.qr_code,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 27,
                        ),
                        Text(
                          'Scan QR Code',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: const Color(0xff3D77BB),
                    onPressed: scanQr,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
