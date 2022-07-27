import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:ihosiris/widgets/custom_bnb.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({Key? key}) : super(key: key);

  static final List<NPKanalysis> reportAnalysis = [
    NPKanalysis('N', 50, Colors.redAccent),
    NPKanalysis('P', 40, Colors.yellow.shade400),
    NPKanalysis('K', 70, Colors.greenAccent),
  ];

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
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.fromLTRB(30, 120, 30, 0),
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
                child: charts.BarChart(series),
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
