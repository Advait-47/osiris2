import 'package:firebase_auth/firebase_auth.dart';
import 'package:ihosiris/models/user.dart';
import 'package:ihosiris/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:ihosiris/widgets/curved_bnb.dart';

class LoginPage extends StatefulWidget {
  //const LoginPage({Key? key}) : super(key: key);
  // final Function toggleView;
  // LoginPage({required this.toggleView});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final existingUser = UserDetails.init();
  String password = '';
  String error = ' ';
  String confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.lightGreen[200],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              //OSIRIS
              const Text(
                'OSIRIS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 65,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your Soil Doctor',
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 30),

              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      //EMAIL
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        margin: const EdgeInsets.symmetric(horizontal: 25.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          validator: (val) =>
                              val!.isEmpty ? 'Enter Email' : null,
                          onChanged: (val) {
                            setState(() => existingUser.email = val);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      //PASSWORD
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        margin: const EdgeInsets.symmetric(horizontal: 25.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          validator: (val) => val!.length < 6
                              ? 'Password must be more than 6 charectars'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      //SIGN IN
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            dynamic result =
                                await _auth.signInWithEmailAndPassword(
                                    existingUser, password);
                            if (result.runtimeType != UserCredential) {
                              print("hi");
                              print(result);
                              setState(() {
                                error = result.toString().replaceAll('-', ' ');
                                error[0].toUpperCase();
                              });
                              //error = 'Could not sign you up';
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CurvedBNB()));
                              //pushReplacementNamed
                              //'/main'
                              //widget.toggleView();
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
                              'Sign In',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  )),

              //forgot password
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        //widget.toggleView();
                        Navigator.pushNamed(context, '/recoveracc');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //not a member register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // ElevatedButton(
                  //     onPressed: () async {
                  //       await FirebaseAuth.instance.sendPasswordResetEmail(
                  //           email: "arduinofan1atmega@gmail.com");
                  //     },
                  //     child: Text("Forgot")),
                  GestureDetector(
                    onTap: () {
                      //widget.toggleView();
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${error[0].toUpperCase()}${error.substring(1)}',
                style: TextStyle(color: Colors.red, fontSize: 18.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
