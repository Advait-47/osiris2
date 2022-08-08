import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ihosiris/models/testData.dart';
import 'package:ihosiris/services/auth.dart';
import 'package:ihosiris/services/database.dart';
import 'dart:math';

class ConnectPage extends StatefulWidget {
  ConnectPage({Key? key}) : super(key: key);

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  User? user = FirebaseAuth.instance.currentUser;

  //final DatabaseService _dbservice = DatabaseService(uid: user.uid);
  final AuthService _auth = AuthService();
  TestData test = TestData.init();

  Future<void> getLatestData() async {
    DatabaseService(uid: user!.uid).getLastTest().then((value) {
      test.fromJson(value);
      print(test.testTime);
      setState(() {});
    });
  }

  postTestData() async {
    DatabaseService(uid: user!.uid.toString())
        .createNewTest(test)
        .then((value) {
      print("yess");
      print(value);
    });
  }

  @override
  void initState() {
    // postTestData();
    // print("happy");
    getLatestData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: Colors.green[200],
          actions: <Widget>[
            TextButton.icon(
              style: TextButton.styleFrom(primary: Colors.black),
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text("Logout"),
            )
          ],
          title: const Text(
            'TEST',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.center,
          color: const Color(0xffEDF2F4),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('CONNECT'),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20.0),
                    fixedSize: Size(350, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    textStyle: TextStyle(
                      fontSize: 30,
                    ),
                    primary: Colors.lightBlueAccent[100],
                    // primary: Colors.lightGreenAccent[100],
                    onPrimary: Colors.black87,
                    elevation: 15,
                  ),
                ),
                SizedBox(height: 60),
                ElevatedButton(
                  child: Text('START TEST'),
                  onPressed: () async {
                    setState(() {
                      test.deviceID = 1;
                      test.lat = 18.518174934068544;
                      test.lon = 73.81512306165963;
                      test.nitrogen = Random().nextDouble() * 100;
                      test.phosphorous = Random().nextDouble() * 100;
                      test.potassium = Random().nextDouble() * 100;
                      test.testTime = DateTime.now().toLocal();
                      test.uploadTime = DateTime.now().toLocal();
                    });
                    await postTestData();
                    print("content");
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20.0),
                    fixedSize: Size(350, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    textStyle: TextStyle(
                      fontSize: 30,
                    ),
                    primary: Colors.lightBlueAccent[100],
                    onPrimary: Colors.black87,
                    elevation: 15,
                  ),
                ),
                SizedBox(height: 60),
                // ElevatedButton(
                //   child: Text('VIEW ANALYSIS'),
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/analysis');
                //   },
                //   style: ElevatedButton.styleFrom(
                //       padding: EdgeInsets.all(20.0),
                //       fixedSize: Size(350, 100),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(20)),
                //       ),
                //       textStyle: TextStyle(
                //         fontSize: 30,
                //       ),
                //       primary: Colors.lightBlueAccent[100],
                //       onPrimary: Colors.black87,
                //       elevation: 15),
                // ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "N:  ${test.nitrogen.toInt()}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "P:  ${test.phosphorous.toInt()}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "K:  ${test.potassium.toInt()}",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
