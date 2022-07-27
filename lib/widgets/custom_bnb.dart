import 'package:flutter/material.dart';
import 'package:ihosiris/screens/main%20tabs/anaylsisgraph.dart';
import 'package:ihosiris/unused/connect2.dart';

import '../screens/main tabs/connect_pages/connect3.dart';
import '../unused/connect1.dart';

class MyBNB extends StatefulWidget {
  const MyBNB({Key? key}) : super(key: key);

  @override
  State<MyBNB> createState() => _MyBNBState();
}

class _MyBNBState extends State<MyBNB> {
  int curr = 1;

  static const List<Widget> _widgetList = [
    ConnectPage(),
    // Connect1Page(),
    GraphPage(),
    Connect2Page(),
  ];

  List<Icon> navBarItems = [
    Icon(Icons.electric_meter),
    Icon(Icons.bar_chart),
    Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetList.elementAt(curr),
      bottomNavigationBar: _bottomNavbar(curr),
    );

    // return BottomNavigationBar(
    //   selectedItemColor: Colors.green[500],
    //   currentIndex: 2,
    //   items: const <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.electric_meter),
    //       label: 'Connect',
    //       //backgroundColor: Colors.green,
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.bar_chart),
    //       label: 'Analysis',
    //       // backgroundColor: Colors.green,
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.person),
    //       label: 'Profile',
    //       // backgroundColor: Colors.lightGreen,
    //     ),
    //   ],
    // );
  }

  void _onItemTapped(int index) {
    setState(() => curr = index);
  }

  Widget _bottomNavbar(int index) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: BoxDecoration(
        // color: Color(0xff2D376E),
        color: Colors.green[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navBarIcon(0),
          _navBarIcon(1),
          _navBarIcon(2),
        ],
      ),
    );
  }

  IconButton _navBarIcon(int index) {
    return IconButton(
      enableFeedback: false,
      onPressed: () {
        setState(() => curr = index);
      },
      icon: navBarItems[index],
    );
  }
}
