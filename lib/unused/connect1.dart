import 'package:flutter/material.dart';
class Connect1Page extends StatelessWidget {
  const Connect1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        title: Text(
          'CONNECT',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            children: [
              SizedBox(height: 60),
              ElevatedButton(
                child: Text('CONNECT'),
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20.0),
                  fixedSize: Size(350, 100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  textStyle: TextStyle(
                    fontSize: 30,
                  ),
                  primary: Colors.lightGreenAccent[100],
                  onPrimary: Colors.black87,
                  elevation: 15,
                ),
              ),

              SizedBox(height: 60),
            ],

          )),
    );
  }
}
