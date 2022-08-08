import 'package:ihosiris/models/user.dart';
import 'package:ihosiris/screens/login%20pages/authenticate.dart';
import 'package:ihosiris/widgets/curved_bnb.dart';
import 'package:flutter/material.dart';
import 'package:ihosiris/screens/login%20pages/login.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserDetails?>(context);
    print(user);

    if (user == null) {
      return LoginPage();
    } else {
      return CurvedBNB();
    }
    //return null;
  }
}
