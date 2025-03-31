import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/nav_entity.dart';
import 'package:dhan_saarthi/feature/fund_detail/presentation/widgets/nav_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/fund_graph/fund_graph_bloc.dart';
import 'nav_button.dart';

class GraphOneLine extends StatelessWidget {
  const GraphOneLine({super.key, required this.navDetails});
  final NavEntity navDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTopDetail(context),
        SizedBox(height: 16),
        SizedBox(height: 209, child: NAVLineChart(navDetails: navDetails)),
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
            buildDetail("NAV", "23.6% (104.2)", kWhiteColor),
            SizedBox(height: 4),
            buildDetail(
              "",
              "",
              Colors.transparent,
            ), //Prevent un-similar size with two-line chart
          ],
        ),
        NavButton(
          onTap: () {
            context.read<FundGraphBloc>().add(ShowInvestGraph());
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
