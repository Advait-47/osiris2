import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:ihosiris/models/testData.dart';
import 'package:ihosiris/services/auth.dart';
import 'package:ihosiris/services/database.dart';
import 'package:ihosiris/widgets/custom_bnb.dart';

class GraphPage extends StatefulWidget {
  GraphPage({Key? key}) : super(key: key);

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  User? user = FirebaseAuth.instance.currentUser;
  TestData oldtest = TestData.init();
  final AuthService _auth = AuthService();

  List<NPKanalysis> reportAnalysis = [];
  Future<void> getLatestData() async {
    DatabaseService(uid: user!.uid).getLastTest().then((value) {
      oldtest.fromJson(value);
      print(oldtest.testTime);
      setState(() {
        reportAnalysis = [
          NPKanalysis('N', oldtest.nitrogen.toInt(), Colors.redAccent),
          NPKanalysis('P', oldtest.phosphorous.toInt(), Colors.yellow.shade400),
          NPKanalysis('K', oldtest.potassium.toInt(), Colors.greenAccent),
        ];
      });
    });
    // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(user!.uid)
    //     .collection('tests')
    //     .get();

    // // Get data from docs and convert map to List
    // print(querySnapshot.docs.last.data());
    // print("pl,mn bvcfghjkl");
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    // print(allData.last);

    // FutureBuilder(
    //   future: DatabaseService(uid: user!.uid).getLastTest(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       print("odsnsudfinfosdf");
    //       return Text(snapshot.data.toString());
    //     } else {
    //       print("object");
    //       return CircularProgressIndicator();
    //     }
    //     // if (snapshot.hasData) {
    //     //   print(snapshot.data);
    //     // } else {
    //     //   print("no data");
    //     // }
    //     // return Text("data");
    //   },
    // );

    // DatabaseService(uid: user!.uid).getLastTest().then((value) {
    //   print(value);
    //   //oldtest = value;
    //   print("object");
    // });
  }

  @override
  void initState() {
    getLatestData();
    print("nice");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<NPKanalysis, String>> series = [
      charts.Series(
        data: reportAnalysis,
        id: 'Soil Analysis Report',
        domainFn: (NPKanalysis repo, _) => repo.component,
        measureFn: (NPKanalysis repo, _) => repo.concentration,
        colorFn: (NPKanalysis repo, _) =>
            charts.ColorUtil.fromDartColor(repo.barColor),
      ),
    ];
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.grey[200],
        backgroundColor: Color(0xffEDF2F4),
        appBar: AppBar(
          actions: <Widget>[
            TextButton.icon(
              style: TextButton.styleFrom(primary: Colors.black),
              icon: Icon(Icons.person),
              onPressed: () async {
                await _auth.signOut();
              },
              label: Text("Logout"),
            )
          ],
          toolbarHeight: MediaQuery.of(context).size.height * 0.1,
          backgroundColor: Colors.green[200],
          title: const Text(
            'N-P-K Analysis',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Test Taken: ${oldtest.testTime}"),
              SizedBox(
                height: 10,
              ),
              Text("Uploaded on: ${oldtest.uploadTime}"),
              SizedBox(
                height: 10,
              ),
              Text("Latitude: ${oldtest.lat}"),
              SizedBox(
                height: 10,
              ),
              Text("Longitude: ${oldtest.lon}"),
              Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.fromLTRB(30, 60, 30, 0),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    color: Color(0xffEDF2F4),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(7, 7),
                        spreadRadius: 4,
                        blurRadius: 7,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-7, -7),
                        spreadRadius: 4,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: charts.BarChart(series) //getLatestData(),
                  ),
            ],
          ),
        ),
        // bottomNavigationBar: const MyBNB(),
      ),
    );
  }
}

class NPKanalysis {
  final String component;
  final int concentration;
  final Color barColor;

  NPKanalysis(this.component, this.concentration, this.barColor);
}
