import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chart'),
      ),
      body: Column(
        children: [
          SizedBox(height: 70),
          Container(
            height: 300,
            child: BarChart(
              BarChartData(
                borderData: FlBorderData(
                    border: Border(
                  top: BorderSide.none,
                  right: BorderSide.none,
                  left: BorderSide(width: 1),
                  bottom: BorderSide(width: 1),
                )),
                groupsSpace: 10,
                barGroups: [
                  BarChartGroupData(x: 1, barRods: [
                    BarChartRodData(y: 10, width: 15, colors: [Colors.amber]),
                  ]),
                  BarChartGroupData(x: 2, barRods: [
                    BarChartRodData(y: 9, width: 15, colors: [Colors.amber]),
                  ]),
                  BarChartGroupData(x: 3, barRods: [
                    BarChartRodData(y: 4, width: 15, colors: [Colors.amber]),
                  ]),
                  BarChartGroupData(x: 4, barRods: [
                    BarChartRodData(y: 2, width: 15, colors: [Colors.amber]),
                  ]),
                  BarChartGroupData(x: 5, barRods: [
                    BarChartRodData(y: 13, width: 15, colors: [Colors.amber]),
                  ]),
                  BarChartGroupData(x: 6, barRods: [
                    BarChartRodData(y: 17, width: 15, colors: [Colors.amber]),
                  ]),
                  BarChartGroupData(x: 7, barRods: [
                    BarChartRodData(y: 19, width: 15, colors: [Colors.amber]),
                  ]),
                  BarChartGroupData(x: 8, barRods: [
                    BarChartRodData(y: 21, width: 15, colors: [Colors.amber]),
                  ]),
                ],
              ),
            ),
          ),
          SizedBox(height: 80),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: FlatButton(
              child: Text(
                'Back To Homepage',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
