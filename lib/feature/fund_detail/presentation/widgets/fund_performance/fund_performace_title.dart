import 'package:dhan_saarthi/core/string_const/icon_string.dart';
import 'package:dhan_saarthi/core/string_const/string_const.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'fund_performace_control.dart';

class FundPerformaceTitle extends StatelessWidget {
  const FundPerformaceTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [buildInvestField(), FundPerfomanceControl()],
    );
  }

  Row buildInvestField() {
    return Row(
      children: [
        Text(
          "If you invested  ",
          style: semiBoldTextStyle.copyWith(fontSize: 14.36),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: k5D5D5DColor, width: 0.9)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: Row(
            children: [
              Text(
                "${kRupee}1L",
                style: semiBoldTextStyle.copyWith(fontSize: 14.36),
              ),
              SizedBox(width: 7.8),
              Image.asset(kPencilIcon, height: 10.8, width: 10.8),
            ],
          ),
        ),
      ],
    );
  }
}
