import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/main tabs/profile_pages/profile.dart';
import '../screens/main tabs/anaylsisgraph.dart';
import '../unused/connect2.dart';
import '../screens/main tabs/connect_pages/connect3.dart';
import '../screens/main tabs/profile_pages/profile.dart';

class CurvedBNB extends StatefulWidget {
  // final int p;

  // const CurvedBNB(this.p, {Key? key}) : super(key: key);
  UserCredential? user;
  CurvedBNB({Key? key}) : super(key: key);

  @override
  // State<CurvedBNB> createState() => _CurvedBNBState(pageNo: p);
  State<CurvedBNB> createState() => _CurvedBNBState();
}

class _CurvedBNBState extends State<CurvedBNB> {
  int flag = 1;
  int pageNo = 1;

  PageController pageController = PageController();
  void _onItemTapped(int index) {
    setState(() {
      flag = index;
    });
    pageController.animateToPage(index,
        duration: Duration(microseconds: 1000), curve: Curves.easeIn);
  }

  final screens = [
    ConnectPage(),
    GraphPage(),
    ProfilePage(),
  ];

  // _CurvedBNBState({pageNo});
  _CurvedBNBState();

  @override
  Widget build(BuildContext context) {
    UserCredential? user = widget.user;
    return Container(
      color: Color(0xFF212529),
      child: SafeArea(
        top: false,
        child: ClipRRect(
          child: Scaffold(
            extendBody: true,
            body: screens[flag],
            // body: PageView(
            //   controller: pageController,
            //   children: [
            //     const ConnectPage(),
            //     const GraphPage(),
            //     const ProfilePage(),
            //   ],
            // ),
            bottomNavigationBar: CurvedNavigationBar(
              // backgroundColor: Colors.transparent,
              backgroundColor: Color(0xffEDF2F4),
              // color: Colors.black,
              color: const Color(0xFF101010),
              buttonBackgroundColor: Colors.green[200],
              index: flag,
              animationDuration: const Duration(milliseconds: 300),
              items: [
                Icon(Icons.electric_meter,
                    color: flag == 0 ? const Color(0xFF101010) : Colors.white),
                Icon(Icons.bar_chart,
                    color: flag == 1 ? const Color(0xFF101010) : Colors.white),
                Icon(Icons.person,
                    color: flag == 2 ? const Color(0xFF101010) : Colors.white),
              ],
              onTap: _onItemTapped,
            ),
          ),
        ),
      ),
    );
  }
}
