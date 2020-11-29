import 'dart:math';
import 'package:flutter/material.dart';

class FireCalculator extends StatefulWidget {
  final double principal;
  final double monthlyInstalment;
  final int years;
  final double marketReturn;
  final double yearlyIncrease;

  FireCalculator({
    this.principal = 5000,
    this.monthlyInstalment = 200,
    this.years = 40,
    this.marketReturn = 0.07,
    this.yearlyIncrease = 0.05,
  });

  @override
  _FireCalculatorState createState() => _FireCalculatorState();
}

class _FireCalculatorState extends State<FireCalculator> {
  final _months = 12;
  double deposit = 0;
  List<double> deposits = [];
  double total = 0;
  List<double> returns = [];

  void _calculate() {
    deposit = widget.principal;
    total = widget.principal;

    for (var i = 1; i <= widget.years; i++) {
      var tmp =
          widget.monthlyInstalment * pow((1 + widget.yearlyIncrease), i - 1);

      for (var k = 0; k < _months; k++) {
        deposit += tmp;
        total += tmp;
        total *= (1 + widget.marketReturn / _months);

        deposits.add(deposit);
        returns.add(total - deposit);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _calculate();
    return Container(
      child: Column(
        children: [
          Text(deposit.toString()),
          Text(total.toString()),
        ],
      ),
    );
  }
}
