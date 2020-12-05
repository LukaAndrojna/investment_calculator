import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './fireplot.dart';
import './fireParameterCard.dart';
import './calcSettings.dart';
import './resultsCard.dart';
import '../models/firedata.dart';

class FireCalculator extends StatefulWidget {
  @override
  _FireCalculatorState createState() => _FireCalculatorState();
}

class _FireCalculatorState extends State<FireCalculator> {
  FireData inputData = FireData();

  Future _openAddEntryDialog() async {
    FireData save =
        await Navigator.of(context).push(new MaterialPageRoute<FireData>(
            builder: (BuildContext context) {
              return FireInputCard(null);
            },
            fullscreenDialog: true));
    if (save != null) {
      setState(() {
        inputData = save;
        inputData.calculate();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    inputData.calculate();
    return Column(
      children: [
        //FireInputCard(_userInputHandler),
        CalcSettings(
          principal: inputData.principal,
          monthlyInstalment: inputData.monthlyInstalment,
          years: inputData.years,
          marketReturn: inputData.marketReturn,
          yearlyIncrease: inputData.yearlyIncrease,
        ),
        Container(
          margin: EdgeInsets.all(7),
          child: RaisedButton(
            padding: EdgeInsets.all(10),
            color: Colors.blueGrey,
            elevation: 5.0,
            child: Text(
              'Edit parameters',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            onPressed: () => _openAddEntryDialog(),
          ),
        ),
        ResultsCard(inputData),
        Fire(inputData, true),
      ],
    );
  }
}
