import 'package:flutter/material.dart';
import 'package:ihosiris/models/testData.dart';
import 'package:ihosiris/models/user.dart';
import 'package:ihosiris/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  // final Function toggleView;
  // SignUp({required this.toggleView});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final newUser = UserDetails.init();
  //const SignUp({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  String password = '';
  String error = ' ';
  String confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.green[200],
        // actions: <Widget>[
        //   TextButton.icon(
        //     style: TextButton.styleFrom(primary: Colors.black),
        //     icon: Icon(Icons.arrow_back),
        //     onPressed: () async {
        //       await _auth.signOut();
        //     },
        //     label: Text("Logout"),
        //   )
        // ],
        title: const Text(
          'SIGN UP',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.green[200],
      //   toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Create an account',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
                SizedBox(height: 35),
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter Full name' : null,
                          onChanged: (val) {
                            setState(() => newUser.name = val);
                          },
                          decoration: InputDecoration(
                              hintText: "Name",
                              labelText: "Name",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(),
                              fillColor: Colors.grey[300],
                              filled: true),
                          obscureText: false,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter Username' : null,
                          onChanged: (val) {
                            setState(() => newUser.username = val);
                          },
                          decoration: InputDecoration(
                              hintText: "Username",
                              labelText: "Username",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(),
                              fillColor: Colors.grey[300],
                              filled: true),
                          obscureText: false,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter Address' : null,
                          onChanged: (val) {
                            setState(() => newUser.address = val);
                          },
                          decoration: InputDecoration(
                              hintText: "Address",
                              labelText: "Address",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(),
                              fillColor: Colors.grey[300],
                              filled: true),
                          obscureText: false,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter Phone' : null,
                          onChanged: (val) {
                            setState(() => newUser.phone = val);
                          },
                          decoration: InputDecoration(
                              hintText: "Phone Number",
                              labelText: "Phone",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(),
                              fillColor: Colors.grey[300],
                              filled: true),
                          obscureText: false,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter Email' : null,
                          onChanged: (val) {
                            setState(() => newUser.email = val);
                          },
                          decoration: InputDecoration(
                              hintText: "Email",
                              labelText: "Email",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(),
                              fillColor: Colors.grey[300],
                              filled: true),
                          obscureText: false,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (val) => val!.length < 6
                              ? 'Password must be more than 6 charectars'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          decoration: InputDecoration(
                              hintText: "Password",
                              labelText: "Password",
                              labelStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(),
                              fillColor: Colors.grey[300],
                              filled: true),
                          obscureText: true,
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          validator: (val) => password != val || val!.isEmpty
                              ? 'Password mismatch'
                              : null,
                          onChanged: (val) {
                            setState(() => confirmPassword = val);
                          },
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                            fillColor: Colors.grey[300],
                            filled: true,
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 35),
                        ElevatedButton(
                          child: Text('Sign Up'),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              dynamic result =
                                  await _auth.registerWithEmailAndPassword(
                                      newUser, password);
                              if (result.runtimeType != UserDetails) {
                                print("bye");
                                setState(() {
                                  error =
                                      result.toString().replaceAll('-', ' ');
                                });
                                print(result.runtimeType);
                                //error = 'Could not sign you up';
                              } else {
                                Navigator.pop(context);
                                //widget.toggleView();
                              }
                            }
                            // if (password == confirmPassword) {
                            //   dynamic result = await _auth
                            //       .registerWithEmailAndPassword(email, password);
                            //   if (result == null) {
                            //     setState(() {
                            //       error = 'Could not sign you up';
                            //     });
                            //     //error = 'Could not sign you up';
                            //   } else {
                            //     widget.toggleView();
                            //   }
                            // } else {
                            //   print("dnsif");
                            //   setState(() {
                            //     error = 'Password mismatch';
                            //   });
                            //   // error = 'Password mismatch';
                            // }

                            //widget.toggleView();
                            //Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(20.0),
                            fixedSize: Size(150, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            textStyle: TextStyle(
                              fontSize: 18,
                            ),
                            primary: Colors.lightBlueAccent[100],
                            onPrimary: Colors.black87,
                            elevation: 15,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          '${error[0].toUpperCase()}${error.substring(1)}',
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
