import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../../core/format_currency.dart';
import '../../domain/enitiies/nav_entity.dart';

class NAVLineChart extends StatefulWidget {
  const NAVLineChart({super.key, required this.navDetails});
  final NavEntity navDetails;

  @override
  State<NAVLineChart> createState() => _NAVLineChartState();
}

class _NAVLineChartState extends State<NAVLineChart> {
  late List<(DateTime, double)>? navGraph;

  @override
  void initState() {
    _reloadData();
    super.initState();
  }

  void _reloadData() async {
    navGraph =
        widget.navDetails.lineGraphData
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
        navGraph?.asMap().entries.map((e) {
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
                // ignore: deprecated_member_use
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
                final date = navGraph![barSpot.x.toInt()].$1;
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
              interval: (navGraph?.length ?? 10) / 3,
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                final date = navGraph?[value.toInt()].$1;
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
