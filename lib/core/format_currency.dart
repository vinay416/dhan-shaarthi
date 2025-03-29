import 'package:dhan_saarthi/core/string_const/string_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class FormatCurrency {
  static String getFormattedCurrency(
    BuildContext context,
    double value, {
    bool noDecimals = true,
  }) {
    final indianFormat = NumberFormat.currency(
      symbol: '₹',
      decimalDigits: noDecimals && value % 1 == 0 ? 0 : 2,
    );
    return indianFormat.format(value);
  }

  static String convertToLacs(double amount, {bool intval = false}) {
    double lacs = amount / 100000;
    if (intval) return "$kRupee ${lacs.toInt()}L";
    return "$kRupee${lacs.toStringAsFixed(1)}L";
  }
}
