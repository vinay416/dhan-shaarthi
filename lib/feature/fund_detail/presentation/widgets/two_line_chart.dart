import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:dhan_saarthi/theme/app_theme.dart';

import '../../../../core/format_currency.dart';
import '../../domain/enitiies/fund_invest_entity.dart';

class TwoLineChart extends StatefulWidget {
  const TwoLineChart({super.key, required this.fundInvestDetails});
  final FundInvestEntity fundInvestDetails;

  @override
  State<TwoLineChart> createState() => _TwoLineChartState();
}

class _TwoLineChartState extends State<TwoLineChart> {
  List<(DateTime, double)>? fundGraph;
  List<(DateTime, double)>? investGraph;

  @override
  void initState() {
    _reloadData();
    super.initState();
  }

  void _reloadData() async {
    fundGraph =
        widget.fundInvestDetails.fundLineGraphData
            .map(
              (e) => (
                DateTime.fromMillisecondsSinceEpoch(e.timestamp),
                e.value,
              ),
            )
            .toList();

    investGraph =
        widget.fundInvestDetails.investmentLineGraphData
            .map(
              (e) => (
                DateTime.fromMillisecondsSinceEpoch(e.timestamp),
                e.value,
              ),
            )
            .toList();
  }

  @override
  Widget build(BuildContext context) {
    final spots =
        fundGraph?.asMap().entries.map((e) {
          final index = e.key;
          final item = e.value;
          final value = item.$2;
          return FlSpot(index.toDouble(), value);
        }).toList() ??
        [];

    final spots2 =
        investGraph?.asMap().entries.map((e) {
          final index = e.key;
          final item = e.value;
          final value = item.$2;
          return FlSpot(index.toDouble(), value);
        }).toList() ??
        [];

    return LineChart(
      duration: Duration.zero,
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            color: kBlueColor,
            spots: spots2,
            isCurved: true,
            preventCurveOverShooting: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                // ignore: deprecated_member_use
                colors: [k6D6D6DColor.withOpacity(0.2), kBlackColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          LineChartBarData(
            color: kOrangeColor,
            spots: spots,
            isCurved: true,
            preventCurveOverShooting: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                // ignore: deprecated_member_use
                colors: [kBlackColor.withOpacity(0.0), kBlackColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
        borderData: FlBorderData(
          show: true,
          border: Border(bottom: BorderSide(color: k6D6D6DColor)),
        ),
        extraLinesData: ExtraLinesData(
          extraLinesOnTop: true,
          horizontalLines: [
            HorizontalLine(y: 62000, color: kBlueColor, strokeWidth: 1),
          ],
        ),
        lineTouchData: LineTouchData(
          touchSpotThreshold: 5,
          getTouchLineStart: (_, __) => -double.infinity,
          getTouchLineEnd: (_, __) => double.infinity,
          getTouchedSpotIndicator: (
            LineChartBarData barData,
            List<int> spotIndexes,
          ) {
            return spotIndexes.map((spotIndex) {
              return TouchedSpotIndicatorData(
                const FlLine(color: kBlueColor, strokeWidth: 1),
                FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 6,
                      color: kWhiteColor,
                      strokeWidth: 0,
                    );
                  },
                ),
              );
            }).toList();
          },
          touchTooltipData: LineTouchTooltipData(
            fitInsideHorizontally: true,
            maxContentWidth: 220,
            tooltipBorder: BorderSide(color: kBlueColor, width: 0.5),
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                final isFirstLine =
                    barSpot.barIndex == 1; // Check if it's the first line

                if (isFirstLine) {
                  return null;
                }
                final date = fundGraph![barSpot.x.toInt()].$1;
                final price1 =
                    isFirstLine
                        ? fundGraph![barSpot.x.toInt()]
                            .$2 // If first line, show prices_line_1
                        : investGraph![barSpot.x.toInt()]
                            .$2; // Otherwise, show prices_line_2

                final price2 =
                    isFirstLine
                        ? investGraph![barSpot.x.toInt()]
                            .$2 // If first line, show prices_line_2
                        : fundGraph![barSpot.x.toInt()]
                            .$2; // Otherwise, show prices_line_1

                return LineTooltipItem(
                  '',
                  const TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                  children: [
                    TextSpan(
                      text: '${date.day}-${date.month}-${date.year}',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: '\n-- ',
                      style: const TextStyle(
                        color: kBlueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Your Investment:${FormatCurrency.getFormattedCurrency(context, price1, noDecimals: true)}',
                      style: const TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text: '\n-- ',
                      style: const TextStyle(
                        color: kOrangeColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Nify Midcap:${FormatCurrency.getFormattedCurrency(context, price2, noDecimals: true)}',
                      style: const TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                );
              }).toList();
            },
            getTooltipColor: (LineBarSpot barSpot) => kBlackColor,
          ),
        ),

        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              interval: (fundGraph?.length ?? 10) / 3,
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                final date = fundGraph?[value.toInt()].$1;
                return SideTitleWidget(
                  fitInside: SideTitleFitInsideData.fromTitleMeta(meta),
                  meta: meta,
                  child: Text(
                    '${date?.year}',
                    style: regularTextStyle.copyWith(
                      fontSize: 10,
                      color: kB0B0B0Color,
                    ),
                  ),
                );
              },
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false, reservedSize: 30),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false, reservedSize: 30),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false, reservedSize: 30),
          ),
        ),
      ),
    );
  }
}
