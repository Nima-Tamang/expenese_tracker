import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyChart extends StatelessWidget {
  const MyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(mainBarData());
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: Colors.amber,
          width: 10,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 5,
            color: Colors.grey.shade300,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(8, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 2);
          case 1:
            return makeGroupData(1, 3);
          case 2:
            return makeGroupData(2, 2);
          case 3:
            return makeGroupData(3, 4.5);
          case 4:
            return makeGroupData(4, 3.8);
          case 5:
            return makeGroupData(5, 1.5);
          case 6:
            return makeGroupData(6, 4);
          case 7:
            return makeGroupData(7, 3.8);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: leftTitles,
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: false),
      barGroups: showingGroups(),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('01', style: style);
        break;
      case 1:
        text = const Text('02', style: style);
        break;
      case 2:
        text = const Text('03', style: style);
        break;
      case 3:
        text = const Text('04', style: style);
        break;
      case 4:
        text = const Text('05', style: style);
        break;
      case 5:
        text = const Text('06', style: style);
        break;
      case 6:
        text = const Text('07', style: style);
        break;
      case 7:
        text = const Text('08', style: style);
        break;
      default:
        text = const Text('Invalid Value', style: style);
    }
    return SideTitleWidget(
      meta: meta,
      space: 12, // Adjust space between axis and title
      child: text,
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    String text;
    if (value == 1) {
      text = 'Rs 1k';
    } else if (value == 2) {
      text = 'Rs 2k';
    } else if (value == 3) {
      text = 'Rs 3k';
    } else if (value == 4) {
      text = 'Rs 4k';
    } else if (value == 5) {
      text = 'Rs 5k';
    } else {
      return Container(); // Return empty widget for other values
    }

    return SideTitleWidget(
      meta: meta,
      space: 0,
      child: Transform.rotate(
        angle: -pi / 6, // Rotate text for better readability
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
