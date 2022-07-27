import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.green[200],
      //   toolbarHeight: MediaQuery.of(context).size.height * 0.1,
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Create an account',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[700],
                    ),
                  )
                ],
              ),
              SizedBox(height: 35),
              Column(
                children: [
                  TextField(
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
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Email",
                        labelText: "email",
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
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "password",
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
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      labelText: "password",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(),
                      fillColor: Colors.grey[300],
                      filled: false,
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 35),
                  ElevatedButton(
                    child: Text('Sign Up'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20.0),
                      fixedSize: Size(150, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                      primary: Colors.lightBlueAccent[100],
                      onPrimary: Colors.black87,
                      elevation: 15,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
