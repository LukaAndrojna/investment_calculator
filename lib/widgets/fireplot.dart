import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../models/finacialdata.dart';
import '../models/firedata.dart';

class Fire extends StatelessWidget {
  final FireData inputData;
  final bool animate;

  Fire(this.inputData, this.animate);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: Card(
            child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                "Investment vs Return over Time",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Expanded(
                child: FirePlot(inputData, animate),
              ),
            ],
          ),
        )));
  }
}

class FirePlot extends StatelessWidget {
  final FireData inputData;
  final bool animate;

  FirePlot(this.inputData, this.animate);

  List<charts.Series<FinancialData, int>> _prepData() {
    return [
      new charts.Series<FinancialData, int>(
        id: 'Investment',
        // colorFn specifies that the line will be blue.
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        // areaColorFn specifies that the area skirt will be light blue.
        areaColorFn: (_, __) =>
            charts.MaterialPalette.blue.shadeDefault.lighter,
        domainFn: (FinancialData investments, _) => investments.year,
        measureFn: (FinancialData investments, _) => investments.money,
        data: inputData.depositData,
      ),
      new charts.Series<FinancialData, int>(
        id: 'Returns',
        // colorFn specifies that the line will be green.
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        // areaColorFn specifies that the area skirt will be light green.
        areaColorFn: (_, __) =>
            charts.MaterialPalette.green.shadeDefault.lighter,
        domainFn: (FinancialData sales, _) => sales.year,
        measureFn: (FinancialData sales, _) => sales.money,
        data: inputData.returnData,
      ),
    ];
  }

  Widget build(BuildContext context) {
    return new charts.LineChart(_prepData(),
        defaultRenderer:
            new charts.LineRendererConfig(includeArea: true, stacked: true),
        animate: animate);
  }
}
