import 'package:dhan_saarthi/core/string_const/string_const.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FundPerformanceInfo extends StatelessWidget {
  const FundPerformanceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [buildInfo1(), buildInfo2()]);
  }

  Row buildInfo2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Profit % (Absolute Return)",
          style: mediumTextStyle.copyWith(fontSize: 10, color: k5D5D5DColor),
        ),
        Text("335.3%", style: mediumTextStyle.copyWith(fontSize: 10)),
      ],
    );
  }

  Row buildInfo1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "This Fund’s past returns",
          style: semiBoldTextStyle.copyWith(fontSize: 12.57),
        ),
        RichText(
          text: TextSpan(
            text: kRupee,
            style: semiBoldTextStyle.copyWith(
              fontSize: 14.5,
              color: kGreenColor,
            ),
            children: [
              TextSpan(
                text: " 3.6 L",
                style: semiBoldTextStyle.copyWith(
                  fontSize: 12.57,
                  color: kGreenColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
