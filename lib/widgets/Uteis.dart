import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Currency {
  static String formartMoney(double value) {
    return NumberFormat.simpleCurrency(
            locale: 'pt_BR', name: 'R\$', decimalDigits: 2)
        .format(value);
  }
}
