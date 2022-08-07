import 'package:flutter/material.dart';
import 'package:ihosiris/services/auth.dart';

class ConnectPage extends StatelessWidget {
  ConnectPage({Key? key}) : super(key: key);
  final AuthService _auth = AuthService();
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
            'PROFILE',
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
            ],
          ),
        ),
      ),
    );
  }
}
