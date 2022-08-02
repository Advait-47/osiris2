// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ihosiris/models/user.dart';
import 'package:ihosiris/services/database.dart';
import 'package:ihosiris/widgets/custom_bnb.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name = 'Shravani Chinchmalatpure';

  UserDetails? userFinal;
  User? user = FirebaseAuth.instance.currentUser;

  fetchData() async {
    DatabaseService(uid: user!.uid).getUserData(user!.uid).then((value) {
      userFinal = value;
      print(userFinal!.phone);
      setState(() {});
    });
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // user = Provider.of<UserDetails?>(context);
    //FUNCTION I WAS TALKING ABOUT
    // dynamic
    // userFinal =
    //     DatabaseService(uid: user!.uid).getUserData(user.uid).then((value) {
    //   print(userFinal);
    // });
    // print(userdetails.runtimeType);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: Colors.green[200],
          title: const Text(
            'PROFILE',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.807,
            color: const Color(0xffEDF2F4),
            child: (userFinal != null)
                ? Builder(builder: (context) {
                    return Column(
                      children: [
                        Container(
                          height: 170,
                          width: 380,
                          margin: const EdgeInsets.symmetric(
                            vertical: 40,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.green[200],
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 4,
                                  spreadRadius: 7,
                                  offset: Offset(-4, -4),
                                ),
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  spreadRadius: 7,
                                  offset: Offset(4, 4),
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[800],
                                radius: 45,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey[400],
                                  radius: 42,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                // 'hi1',
                                '@${userFinal!.username}',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.grey[300],
                          color: Color(0xffEDF2F4),
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                            top: 25,
                            left: 25,
                            right: 25,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  // 'hi2',
                                  'Contact: ${userFinal!.phone}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  // 'hi3',
                                  'Address: ${userFinal!.address}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  // 'hi4',
                                  'Email Address: ${userFinal!.email}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            // child: Text(
                            //   ' \tCONTACT: 7219808011\n\n\n \tADDRESS: Krushna Nagar,Amravati\n\n\n \tDEVICE ID: 123654',
                            //   style:
                            //       TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                            // ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          margin: const EdgeInsets.symmetric(vertical: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/support');
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(20.0),
                                  fixedSize: const Size(150, 60),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  primary: Colors.lightBlueAccent[100],
                                  onPrimary: Colors.black87,
                                  elevation: 10,
                                ),
                                child: const Text('SUPPORT'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(20.0),
                                  fixedSize: const Size(150, 60),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  primary: Colors.lightBlueAccent[100],
                                  onPrimary: Colors.black87,
                                  elevation: 10,
                                ),
                                child: const Text('SETTINGS'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  })
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
        ),
      ),
    );
  }
}
