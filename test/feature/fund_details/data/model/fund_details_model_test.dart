import 'dart:convert';

import 'package:dhan_saarthi/feature/fund_detail/data/models/bar_graph_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/fund_invest_details_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/fund_performace_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/graph_data_model.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/models/nav_details_model.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixtures.dart';

void main() {
  group("Fund Models Test", () {
    test("NAV Fund Model success", () {
      final List graphData = [
        [1711670400000, 65526.713768406174],
        [1711756800000, 64739.24207573283],
        [1711843200000, 64538.55260842681],
        [1711929600000, 66012.15293045473],
        [1712016000000, 64987.58440425927],
        [1712102400000, 60773.862930874704],
        [1712188800000, 61012.09522243375],
        [1712275200000, 63241.87913574653],
        [1712361600000, 62689.87435787321],
        [1712448000000, 63632.39935297565],
        [1712534400000, 64086.823460256426],
        [1712620800000, 65931.06490439967],
        [1712707200000, 63687.50350010323],
        [1712793600000, 65668.16571700791],
        [1712880000000, 65354.13336928861],
        [1712966400000, 63099.287555906376],
        [1713052800000, 60427.82751512378],
        [1713139200000, 61736.684829580605],
        [1713225600000, 59686.89912995451],
        [1713312000000, 59995.209903171795],
        [1713398400000, 57478.36312839251],
        [1713484800000, 59623.56249209243],
        [1713571200000, 60012.93722485975],
        [1713657600000, 60862.26888013952],
        [1713744000000, 60924.51880957888],
      ];
      final expected = NavDetailsModel(
        lineGraphData:
            graphData.map((e) => GraphDataModel.fromJson(e)).toList(),
        name: "Motilal Oswal Midcap Direct Growth",
      );
      final navJson = jsonDecode(Fixtures().call("nav_details_fixture.json"));
      final navModel = NavDetailsModel.fromJson(navJson);
      expect(navModel, expected);
    });
  });

  test("Invest Fund Details", () {
    //assert
    final fundData = [
      [1711670400000, 65526.71],
      [1711756800000, 64739.24],
      [1711843200000, 64538.55],
      [1711929600000, 66012.15],
      [1712016000000, 64987.58],
      [1712102400000, 60773.86],
      [1712188800000, 61012.1],
      [1712275200000, 63241.88],
      [1712361600000, 62689.87],
      [1712448000000, 63632.4],
      [1712534400000, 64086.82],
      [1712620800000, 65931.06],
      [1712707200000, 63687.5],
      [1712793600000, 65668.17],
      [1712880000000, 65354.13],
      [1712966400000, 63099.29],
      [1713052800000, 60427.83],
      [1713139200000, 61736.68],
      [1713225600000, 59686.9],
      [1713312000000, 59995.21],
      [1713398400000, 57478.36],
      [1713484800000, 59623.56],
      [1713571200000, 60012.94],
      [1713657600000, 60862.27],
      [1713744000000, 60924.52],
    ];
    final investData = [
      [1711670400000, 67226.55],
      [1711756800000, 65845.95],
      [1711843200000, 65548.76],
      [1711929600000, 67012.53],
      [1712016000000, 66395.92],
      [1712102400000, 62500.3],
      [1712188800000, 61500.5],
      [1712275200000, 64380.34],
      [1712361600000, 64595.47],
      [1712448000000, 65621.32],
      [1712534400000, 65890.52],
      [1712620800000, 67800.24],
      [1712707200000, 65450.85],
      [1712793600000, 67050.85],
      [1712880000000, 66120.45],
      [1712966400000, 64050.35],
      [1713052800000, 61500.25],
      [1713139200000, 62950.44],
      [1713225600000, 62000.78],
      [1713312000000, 61550.19],
      [1713398400000, 59360.44],
      [1713484800000, 61750.82],
      [1713571200000, 61520.01],
      [1713657600000, 63000.78],
      [1713744000000, 63310.53],
    ];
    final expected = FundInvestDetailsModel(
      name: "Motilal Oswal Midcap Direct Growth",
      fundLineGraphData:
          fundData.map((e) => GraphDataModel.fromJson(e)).toList(),
      investmentLineGraphData:
          investData.map((e) => GraphDataModel.fromJson(e)).toList(),
    );
    //act
    final investFundJson = jsonDecode(
      Fixtures().call("invest_fund_details_fixture.json"),
    );
    final investFundmodel = FundInvestDetailsModel.fromJson(investFundJson);
    //verify or expect
    expect(investFundmodel, expected);
  });

  test("Fund Performace Model", () {
    //assert
    final FundPerformaceModel expected = FundPerformaceModel(
      name: "Motilal Oswal Midcap Direct Growth",
      graphData: [
        BarGraphModel(
          x: 0,
          barRods: [
            BarDataModel(
              toY: 190000,
              bars: [
                BarItemModel(start: 0, end: 100000, color: k3D3D3DColor),
                BarItemModel(start: 100000, end: 190000, color: kGreenColor),
              ],
            ),
          ],
        ),
        BarGraphModel(
          x: 1,
          barRods: [
            BarDataModel(
              toY: 363000,
              bars: [
                BarItemModel(start: 0, end: 80000, color: k3D3D3DColor),
                BarItemModel(start: 80000, end: 363000, color: kGreenColor),
              ],
            ),
          ],
        ),
        BarGraphModel(
          x: 2,
          barRods: [
            BarDataModel(
              toY: 455000,
              bars: [
                BarItemModel(start: 0, end: 40000, color: k3D3D3DColor),
                BarItemModel(start: 40000, end: 455000, color: kGreenColor),
              ],
            ),
          ],
        ),
      ],
    );
    //act
    final decodeJson = jsonDecode(
      Fixtures().call("fund_performance_fixture.json"),
    );
    final model = FundPerformaceModel.fromJson(decodeJson);
    //verify or expect
    expect(model, expected);
  });
}
