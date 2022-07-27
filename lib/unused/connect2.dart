import 'package:flutter/material.dart';

class Connect2Page extends StatelessWidget {
  const Connect2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDF2F4),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        backgroundColor: Colors.green[200],
        title: const Text(
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
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20.0),
              fixedSize: const Size(350, 100),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              textStyle: const TextStyle(
                fontSize: 30,
              ),
              primary: Colors.lightGreenAccent[100],
              onPrimary: Colors.black87,
              elevation: 15,
            ),
            child: const Text('CONNECT'),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20.0),
              fixedSize: const Size(350, 100),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              textStyle: const TextStyle(
                fontSize: 30,
              ),
              primary: Colors.lightGreenAccent[100],
              onPrimary: Colors.black87,
              elevation: 15,
            ),
            child: const Text('START TEST'),
          ),
        ],
      )),
    );
  }
}
