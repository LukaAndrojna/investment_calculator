import 'package:flutter/material.dart';

class CalcSettings extends StatelessWidget {
  final double principal;
  final double monthlyInstalment;
  final int years;
  final double marketReturn;
  final double yearlyIncrease;

  CalcSettings({
    this.principal,
    this.monthlyInstalment,
    this.years,
    this.marketReturn,
    this.yearlyIncrease,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Calculation settings:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Principal: $principal',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Monthly instalment: $monthlyInstalment',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Years investing: $years',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Average market returns: $marketReturn',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Increase of monthly instalment per year: $yearlyIncrease',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
