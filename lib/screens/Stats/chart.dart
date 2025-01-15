import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';

class MyChart extends StatelessWidget {
  const MyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarChart()
    );
  }

  BarChartData mainBarData(){
    return BarChartData(
      titlesData: FlTitlesData(
        show:true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false)
        ),
         topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false)
        ),
         bottomTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false)
        ),
         leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false)
        ),
      )
    )
  }
}