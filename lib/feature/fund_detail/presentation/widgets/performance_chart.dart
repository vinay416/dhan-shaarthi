import 'package:dhan_saarthi/core/format_currency.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../domain/enitiies/fund_performace_enity.dart';

class PerformanceChart extends StatefulWidget {
  const PerformanceChart({super.key, required this.performaceData});
  final FundPerformaceEntity performaceData;
  final Color dark = k3D3D3DColor;
  final Color normal = kGreenColor;

  @override
  State<StatefulWidget> createState() => PerformanceChartState();
}

class PerformanceChartState extends State<PerformanceChart> {
  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(fontSize: 14, color: kWhiteColor);
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Saving A/C';
        break;
      case 1:
        text = 'Category Avg.';
        break;
      case 2:
        text = 'Direct Plan';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(meta: meta, child: Text(text, style: style));
  }

  BarTouchData get barTouchData => BarTouchData(
    enabled: false,
    touchTooltipData: BarTouchTooltipData(
      getTooltipColor: (group) => Colors.transparent,
      tooltipPadding: EdgeInsets.zero,
      tooltipMargin: 8,
      getTooltipItem: (
        BarChartGroupData group,
        int groupIndex,
        BarChartRodData rod,
        int rodIndex,
      ) {
        return BarTooltipItem(
          FormatCurrency.convertToLacs(rod.toY),
          const TextStyle(color: kWhiteColor, fontWeight: FontWeight.bold),
        );
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.66,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final barsSpace = constraints.maxWidth / 5;
            final barsWidth = 60.0 * constraints.maxWidth / 400;
            return BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                barTouchData: barTouchData,
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: bottomTitles,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                gridData: FlGridData(show: false),
                borderData: FlBorderData(
                  show: true,
                  border: Border(
                    bottom: BorderSide(color: kWhiteColor, width: 0.9),
                  ),
                ),
                groupsSpace: barsSpace,
                barGroups: getData(barsWidth, barsSpace),
              ),
            );
          },
        ),
      ),
    );
  }

  List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    return widget.performaceData.graphData
        .map(
          (e) => BarChartGroupData(
            x: e.x,
            barsSpace: barsSpace,
            showingTooltipIndicators: [0],
            barRods:
                e.barRods
                    .map(
                      (e) => BarChartRodData(
                        toY: e.toY,
                        rodStackItems:
                            e.bars
                                .map(
                                  (e) => BarChartRodStackItem(
                                    e.start.toDouble(),
                                    e.end.toDouble(),
                                    e.color,
                                  ),
                                )
                                .toList(),
                        borderRadius: BorderRadius.zero,
                        width: barsWidth,
                        color: Colors.transparent,
                      ),
                    )
                    .toList(),
          ),
        )
        .toList();
  }
}
