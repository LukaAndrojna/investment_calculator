import 'package:flutter/material.dart';

import '../models/firedata.dart';

class FireInputCard extends StatefulWidget {
  final Function inputHandler;

  FireInputCard(this.inputHandler);

  @override
  _FireInputCardState createState() => _FireInputCardState();
}

class _FireInputCardState extends State<FireInputCard> {
  String _principal = '5000';
  String _monthlyInstalment = '200';
  String _years = '40';
  String _marketReturn = '0.07';
  String _yearlyIncrease = '0.05';
  final principalController = TextEditingController();
  final monthlyInstalmentController = TextEditingController();
  final yearController = TextEditingController();
  final marketReturnController = TextEditingController();
  final increaseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Parameters'),
        actions: [
          new FlatButton(
              onPressed: () {
                Navigator.of(context).pop(new FireData(
                  principal: double.parse(_principal),
                  monthlyInstalment: double.parse(_monthlyInstalment),
                  years: int.parse(_years),
                  marketReturn: double.parse(_marketReturn),
                  yearlyIncrease: double.parse(_yearlyIncrease),
                ));
              },
              child: new Text('SAVE',
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      .copyWith(color: Colors.white))),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Principal',
                    hintText: '$_principal',
                  ),
                  controller: principalController,
                  onChanged: (value) => _principal = value,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Monthly Instalment',
                    hintText: '$_monthlyInstalment',
                  ),
                  controller: monthlyInstalmentController,
                  onChanged: (value) => _monthlyInstalment = value,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Years you want to be investing',
                    hintText: '$_years',
                  ),
                  controller: yearController,
                  onChanged: (value) => _years = value,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Market Return',
                    hintText: '$_marketReturn',
                  ),
                  controller: marketReturnController,
                  onChanged: (value) => _marketReturn = value,
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText:
                        'Increase of your monthly instalment per year in percent',
                    hintText: '$_yearlyIncrease',
                  ),
                  controller: increaseController,
                  onChanged: (value) => _yearlyIncrease = value,
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
