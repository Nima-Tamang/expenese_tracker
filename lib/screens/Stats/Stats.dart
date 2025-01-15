import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: 
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 25,vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Transactions',
            style:TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold

            ),),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: BarChart(
                BarChartData(
                  
                  )
              ),

            )
          ],
        ),
        ),
        );
  }
}