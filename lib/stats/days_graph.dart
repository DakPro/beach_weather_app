import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DaysGraph extends StatefulWidget {
  final Map loadData;
  final String title;

  const DaysGraph({super.key, required this.loadData, required this.title});

  @override
  State<DaysGraph> createState() => _DaysGraphState();
}

// Code adapted from https://github.com/imaNNeo/fl_chart/blob/main/example/lib/presentation/samples/line/line_chart_sample2.dart
class _DaysGraphState extends State<DaysGraph> {
  TextStyle axisStyle = TextStyle(
    color: Colors.white70,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  List<Color> gradientColors = [Color(0x00FFFFFF), Color(0x000FFFFF)];

  Map<DateTime, num> data = {};

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 14,
              left: 14,
              top: 40,
              bottom: 12,
            ),
            child: LineChart(mainData()),
          ),
        ),
        Positioned(
          top: 6,
          left: 16,
          child: Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: Color(0xFF121418),
            ),
          ),
        )
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    // Device's current time
    // NOT LOCAL TIME
    // TODO: Convert to local time
    var days = widget.loadData.keys.toList();
    int index = value.toInt();
    DateTime date = days[index];
    String text = "${date.day}/${date.month}";

    return SideTitleWidget(meta: meta, child: Text(text, style: axisStyle));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    int h = value.floor();
    int m = ((value - h) * 60).round();
    String text = '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}';

    return Text(text, style: axisStyle, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    var days = widget.loadData.keys.toList();

    var spots = <FlSpot>[];
    for (int i = 0; i < days.length; i++) {
      final date = days[i], sunriseTime = widget.loadData[date]!;
      spots.add(FlSpot(i.toDouble(),  sunriseTime.toDouble()));
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
              int h = touchedSpot.y.floor();
              int m = ((touchedSpot.y - h) * 60).toInt();
              return LineTooltipItem(
                '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}',
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
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
            maxIncluded: false,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 0.1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 52,
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
          barWidth: 2,
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