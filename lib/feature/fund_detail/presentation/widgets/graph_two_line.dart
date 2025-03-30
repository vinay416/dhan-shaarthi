import 'package:dhan_saarthi/feature/fund_detail/presentation/widgets/two_line_chart.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/fund_graph/fund_graph_bloc.dart';
import 'nav_button.dart';

class GraphTwoLine extends StatelessWidget {
  const GraphTwoLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTopDetail(context),
        SizedBox(height: 16),
        SizedBox(height: 209, child: TwoLineChart()),
      ],
    );
  }

  Row buildTopDetail(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            buildDetail("Your Investments", "-19.75%", kBlueColor),
            SizedBox(height: 4),
            buildDetail("Nifty Midcap 150", "-12.75%", kOrangeColor),
          ],
        ),
        NavButton(
          onTap: () {
            context.read<FundGraphBloc>().add(ShowNavGraph());
          },
        ),
      ],
    );
  }

  Row buildDetail(String title, String value, Color color) {
    return Row(
      spacing: 9,
      children: [
        Container(width: 16, height: 1, color: color),
        Text(
          title,
          style: regularTextStyle.copyWith(fontSize: 10, color: color),
        ),
        Text(
          value,
          style: regularTextStyle.copyWith(fontSize: 12, color: color),
        ),
      ],
    );
  }
}
