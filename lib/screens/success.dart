import 'package:flutter/material.dart';
import 'package:zq/screens/signin_screen.dart';

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
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
                  Text(
                    'Riham Ghallab',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 90.0,
              ),
              Center(
                child: Container(
                    width: 300,
                    height: 230,
                    //  padding: new EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        children: [
                          Container(
                              padding: const EdgeInsets.only(top: 40),
                              child: const Text(
                                'Successful Scan!',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff3D77BB)),
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            'you are marked as present',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3D77BB)),
                          ),
                          const SizedBox(height: 30,),
                          SizedBox(
                            width: 100,
                            height: 41,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xff3D77BB),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const SigninScreen()));
                              },
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}