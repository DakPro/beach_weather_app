import 'dart:math';

import 'package:flutter/material.dart';
import 'package:beach_weather_app/weather/open_meteo.dart';
import 'package:beach_weather_app/stats/graph.dart';

class StatsPage extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget> widgets;

  const StatsPage({
    super.key,
    required this.title,
    required this.description,
    required this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    final top = Container(
      margin: const EdgeInsets.only(top: 52, left: 8, right: 8, bottom: 10),
      height: 90,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFF264864).withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    final bottom = Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(left: 8, right: 8, top: 32, bottom: 32),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFF264864).withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        children: [
          ...widgets,
          Text(description, style: TextStyle(color: Colors.white70)),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF264864)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background_3_v1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [top, Expanded(child: bottom)]),
      ),
    );
  }
}

void main() async {
  var o = initOpenMeteo(0.13, 52.2);
  var graph = Graph(loadData: o.then((x) => x.getAQI()));

  runApp(
    MaterialApp(
      home: StatsPage(
        title: "AQI",
        description: "AQI is measured from 0 to 100...",
        widgets: [graph],
      ),
    ),
  );

}
