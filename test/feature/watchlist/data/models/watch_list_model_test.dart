import 'dart:convert';

import 'package:dhan_saarthi/feature/watchlist/data/models/fund_model.dart';
import 'package:dhan_saarthi/feature/watchlist/data/models/watchlist_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixtures.dart';

void main() {
  group("Watchlist model", () {
    test("From Json/map", () {
      //assert
      final expected = [
        WatchlistModel(
          id: "watchlist 1",
          fundsList: [
            FundModel(name: "Tata AIA", navValue: "120.0"),
            FundModel(name: "SBI Direct", navValue: "220.0"),
          ],
        ),
        WatchlistModel(
          id: "watchlist 2",
          fundsList: [
            FundModel(name: "MRF", navValue: "4120.0"),
            FundModel(name: "Nivia", navValue: "920.0"),
          ],
        ),
      ];
      //act
      final List jsonList = jsonDecode(
        Fixtures().call("watchlist_fixture.json"),
      );
      final model = jsonList.map((e) => WatchlistModel.fromJson(e)).toList();
      //verify or expect
      expect(model, expected);
    });

    test("to map", () {
      //assert
      final modelList = [
        WatchlistModel(
          id: "watchlist 1",
          fundsList: [
            FundModel(name: "Tata AIA", navValue: "120.0"),
            FundModel(name: "SBI Direct", navValue: "220.0"),
          ],
        ),
        WatchlistModel(
          id: "watchlist 2",
          fundsList: [
            FundModel(name: "MRF", navValue: "4120.0"),
            FundModel(name: "Nivia", navValue: "920.0"),
          ],
        ),
      ];

      //act
      final mapList = modelList.map((e) => e.toMap()).toList();
      final encoded = jsonEncode(mapList);
      final expected = Fixtures().call("watchlist_fixture.json");
      //verify or expect
      expect(encoded, expected);
    });
  });
}
