import 'package:ihosiris/screens/login pages/signup.dart';
import 'package:ihosiris/screens/login pages/login.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    // if (showSignIn) {
    //   return LoginPage(toggleView: toggleView);
    // } else {
    //   return SignUp(toggleView: toggleView);
    // }
    return Text("lets see");
  }
}
