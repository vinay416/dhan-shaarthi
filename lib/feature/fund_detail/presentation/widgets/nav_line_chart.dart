import 'dart:convert';

import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/format_currency.dart';

class NAVLineChart extends StatefulWidget {
  const NAVLineChart({super.key});

  @override
  State<NAVLineChart> createState() => _NAVLineChartState();
}

class _NAVLineChartState extends State<NAVLineChart> {
  List<(DateTime, double)>? _bitcoinPriceHistory;

  @override
  void initState() {
    _reloadData();
    super.initState();
  }

  void _reloadData() async {
    final dataStr = await rootBundle.loadString('assets/nav_data.json');
    final json = jsonDecode(dataStr) as Map<String, dynamic>;

    _bitcoinPriceHistory =
        (json['prices'] as List).map((item) {
          final timestamp = item[0] as int;
          final price = item[1] as double;
          return (DateTime.fromMillisecondsSinceEpoch(timestamp), price);
        }).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final spots =
        _bitcoinPriceHistory?.asMap().entries.map((e) {
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
            color: kWhiteColor,
            spots: spots,
            isCurved: true,
            preventCurveOverShooting: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [k6D6D6DColor.withOpacity(0.5), kBlackColor],
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
            tooltipBorder: BorderSide(color: kBlueColor, width: 0.5),
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                final price = barSpot.y;
                final date = _bitcoinPriceHistory![barSpot.x.toInt()].$1;
                return LineTooltipItem(
                  '',
                  const TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                  children: [
                    TextSpan(
                      text: '${date.year}-${date.month}-${date.day}',
                      style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    TextSpan(
                      text:
                          '\n- NAV:${FormatCurrency.getFormattedCurrency(context, price, noDecimals: true)}',
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
              interval: (_bitcoinPriceHistory?.length ?? 10) / 3,
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                final date = _bitcoinPriceHistory?[value.toInt()].$1;
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
