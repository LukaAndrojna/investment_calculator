import 'package:flutter/material.dart';

import '../models/firedata.dart';

class ResultsCard extends StatelessWidget {
  final FireData inputData;

  ResultsCard(this.inputData);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Investment results',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Your deposits after ${inputData.years} will amount to ${inputData.deposit.toStringAsFixed(0)}.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              'Which in total will amount to ${inputData.total.toStringAsFixed(0)}',
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
