import 'package:dhan_saarthi/feature/watchlist/domain/enities/fund_entity.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class FundItem extends StatelessWidget {
  const FundItem({super.key, required this.fund});
  final FundEntity fund;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: k454545Color),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildValues(),
          buildTitles(),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTimeTitle("1D"),
              _buildTimeTitle("1M"),
              _buildTimeTitle("6M"),
              _buildTimeTitle("1Y"),
              _buildTimeTitle("3Y"),
              _buildTimeTitle("5Y"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeTitle(String time) {
    final valueOverTime = math.Random().nextInt(
      double.parse(fund.navValue).toInt(),
    );
    return Column(
      children: [
        Text(time, style: mediumTextStyle.copyWith(fontSize: 14)),
        Text(
          valueOverTime.toString(),
          style: mediumTextStyle.copyWith(fontSize: 14, color: kGreenColor),
        ),
      ],
    );
  }

  Row buildTitles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Fund",
          style: mediumTextStyle.copyWith(fontSize: 18, color: kB0B0B0Color),
        ),
        Text(
          "Nav",
          style: mediumTextStyle.copyWith(fontSize: 18, color: kB0B0B0Color),
        ),
      ],
    );
  }

  Row buildValues() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          fund.name,
          style: semiBoldTextStyle.copyWith(fontSize: 18, letterSpacing: 1),
        ),
        Text(
          fund.navValue,
          style: semiBoldTextStyle.copyWith(
            fontSize: 18,
            letterSpacing: 1,
            color: kGreenDarkColor,
          ),
        ),
      ],
    );
  }
}
