import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../../domain/enitiies/fund_performace_enity.dart';
import 'fund_performance/fund_performace_title.dart';
import 'fund_performance/fund_performance_info.dart';
import 'fund_performance/fund_performance_slider.dart';
import 'performance_chart.dart';

class FundPerformace extends StatelessWidget {
  const FundPerformace({super.key, required this.performaceData});
  final FundPerformaceEntity performaceData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: k5D5D5DColor, width: 0.45),
        borderRadius: BorderRadius.circular(7.8),
        color: k262626Color,
      ),
      padding: EdgeInsets.all(14.36),
      child: Column(
        children: [
          FundPerformaceTitle(),
          SizedBox(height: 14.36),
          FundPerformanceSlider(),
          SizedBox(height: 32.32),
          FundPerformanceInfo(),
          SizedBox(height: 32.32),
          SizedBox(
            height: 167,
            child: PerformanceChart(performaceData: performaceData),
          ),
        ],
      ),
    );
  }
}
