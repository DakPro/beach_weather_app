import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Graph extends StatefulWidget {
  final Future<Map<DateTime, num>> loadData;

  const Graph({super.key, required this.loadData});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  TextStyle axisStyle = TextStyle(
    color: Colors.white70,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  List<Color> gradientColors = [Color(0x00FFFFFF), Color(0x000FFFFF)];

  Map<DateTime, num> data = {};

  @override
  Widget build(BuildContext context) {
    widget.loadData.then(
      (x) => setState(() {
        data = x;
      }),
    );
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: LineChart(mainData()),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    // Device's current time
    // NOT LOCAL TIME
    // TODO: Convert to local time
    var now = DateTime.now();
    var nnow = DateTime.fromMillisecondsSinceEpoch(
      now.millisecondsSinceEpoch - now.millisecondsSinceEpoch % 3600_000,
    );
    var time = nnow.add(Duration(hours: value.toInt()));
    String text = "${time.hour}:00";

    return SideTitleWidget(meta: meta, child: Text(text, style: axisStyle));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    String text = value.toStringAsPrecision(2);

    return Text(text, style: axisStyle, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    var now = DateTime.now().toUtc();
    var nnow = DateTime.fromMillisecondsSinceEpoch(
      now.millisecondsSinceEpoch - now.millisecondsSinceEpoch % 3600_000,
    );

    var spots = <FlSpot>[];
    for (int i = 0; i < 10; i++) {
      var x = data[nnow.add(Duration(hours: i))] ?? (i*i - 5*i);
      spots.add(FlSpot(i.toDouble(), x.toDouble()));
    }

    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          maxContentWidth: 100,
          getTooltipColor: (touchedSpot) => Colors.white60,
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              final textStyle = TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              );
              return LineTooltipItem(
                touchedSpot.y.toStringAsFixed(2),
                textStyle,
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
        getTouchLineStart: (data, index) => 0,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 2,
            getTitlesWidget: bottomTitleWidgets,
            maxIncluded: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            maxIncluded: false,
            minIncluded: false,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          aboveBarData: BarAreaData(
            show: true,
            cutOffY: 0,
            applyCutOffY: true,
            gradient: LinearGradient(
              colors:
                  gradientColors
                      .map((color) => color.withValues(alpha: 0.3))
                      .toList(),
            ),
          ),
          belowBarData: BarAreaData(
            show: true,
            cutOffY: 0,
            applyCutOffY: true,
            gradient: LinearGradient(
              colors:
                  gradientColors
                      .map((color) => color.withValues(alpha: 0.3))
                      .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
