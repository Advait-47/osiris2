import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecoverAccount extends StatefulWidget {
  const RecoverAccount({Key? key}) : super(key: key);

  @override
  State<RecoverAccount> createState() => _RecoverAccount();
}

class _RecoverAccount extends State<RecoverAccount> {
  final _formKey = GlobalKey<FormState>();
  String email = ' ';
  String sentmsg = ' ';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green[200],
          leading: BackButton(
            color: Colors.black,
          )),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          const Text(
            'OSIRIS',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 65,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          const Text(
            'Enter your Email address to send account recovery details',
            textAlign: TextAlign.left,
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    margin: const EdgeInsets.symmetric(horizontal: 25.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      validator: (val) => val!.isEmpty ? 'Enter Email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance
                              .sendPasswordResetEmail(email: email)
                              .then((value) {
                            setState(() {
                              sentmsg = "Password reset link sent";
                            });
                          });
                        } on FirebaseAuthException catch (e) {
                          sentmsg = e.code.toString();
                        }
                      }
                      //Navigator.pushReplacementNamed(context, '/main');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.green[600],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Send link',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Text(
            '${sentmsg[0].toUpperCase()}${sentmsg.substring(1)}',
            style: TextStyle(color: Colors.red, fontSize: 18.0),
          )
        ],
      ),
    ));
  }
}
