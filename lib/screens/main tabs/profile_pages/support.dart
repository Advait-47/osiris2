import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green[200],
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: Text(
          'SUPPORT',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              'FAQs',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.end,
            ),
            SizedBox(height: 400),
            ElevatedButton(
              child: Text('Call Customer Care'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(20.0),
                fixedSize: Size(350, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                primary: Colors.lightBlue[200],
                onPrimary: Colors.black87,
                elevation: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
