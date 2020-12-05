import 'dart:math';

import './finacialdata.dart';

class FireData {
  final double principal;
  final double monthlyInstalment;
  final int years;
  final int months;
  final double marketReturn;
  final double yearlyIncrease;
  double deposit = 0;
  double total = 0;
  List<FinancialData> depositData = [];
  List<FinancialData> returnData = [];

  FireData({
    this.principal = 5000,
    this.monthlyInstalment = 200,
    this.years = 40,
    this.months = 12,
    this.marketReturn = 0.07,
    this.yearlyIncrease = 0.05,
  });

  void calculate() {
    depositData = [];
    returnData = [];
    deposit = principal;
    total = principal;

    for (var i = 1; i <= years; i++) {
      var tmp = monthlyInstalment * pow((1 + yearlyIncrease), i - 1);

      for (var k = 0; k < months; k++) {
        deposit += tmp;
        total += tmp;
        total *= (1 + marketReturn / months);
      }

      depositData.add(FinancialData(i, deposit));
      returnData.add(FinancialData(i, total - deposit));
    }
  }
}
