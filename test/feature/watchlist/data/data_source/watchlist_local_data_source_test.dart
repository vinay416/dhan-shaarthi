import 'dart:convert';

import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:dhan_saarthi/feature/watchlist/data/data_source/watchlist_local_data_source.dart';
import 'package:dhan_saarthi/feature/watchlist/data/models/fund_model.dart';
import 'package:dhan_saarthi/feature/watchlist/data/models/watchlist_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/prefs_mock/mock_shared_prefs.mocks.dart';
import '../../../../fixtures/fixtures.dart';

void main() {
  final mockPrefs = MockSharedPrefs();
  final localSource = WatchlistLocalDataSourceImpl(mockPrefs);

  group("Get Watchlist", () {
    test("Get watchlist success", () async {
      //assert
      final watchListString = ["watchlist 1", "watchlist 2"];
      when(mockPrefs.getStringList(any)).thenReturn(watchListString);
      final stringData = Fixtures().call("watchlist_fixture.json");
      final List list = jsonDecode(stringData);

      when(mockPrefs.getString("watchlist 1")).thenReturn(jsonEncode(list[0]));
      when(mockPrefs.getString("watchlist 2")).thenReturn(jsonEncode(list[1]));
      //act
      final response = await localSource.getWatchlist();
      //verify or expect
      verify(mockPrefs.getStringList(any));
      verify(mockPrefs.getString(any));
      final watchlist = list.map((e) => WatchlistModel.fromJson(e)).toList();
      expect(response, watchlist);
    });

    test("Get watchlist is empty", () async {
      //assert
      when(mockPrefs.getStringList(any)).thenReturn(null);
      //act
      final response = await localSource.getWatchlist();
      //verify or expect
      verify(mockPrefs.getStringList(any));
      expect(response, []);
    });

    test("Get watchlist [watchlist 1] but failed to get object", () async {
      //assert
      final watchListString = ["watchlist 1"];
      when(mockPrefs.getStringList(any)).thenReturn(watchListString);
      when(mockPrefs.getString(any)).thenReturn(null);
      //act
      final response = await localSource.getWatchlist();
      //verify or expect
      verify(mockPrefs.getStringList(any));
      verify(mockPrefs.getString(any));
      expect(response, []);
    });
  });

  group("Add Watchlist", () {
    test("Add watchlist [watchlist 1] with no funds success", () async {
      //assert
      final List<String> watchListString = [];
      when(mockPrefs.getStringList(any)).thenReturn(watchListString);
      when(mockPrefs.setStringList(any, any)).thenAnswer((_) async => true);
      when(mockPrefs.setString(any, any)).thenAnswer((_) async => true);
      //act
      final watchitem = WatchlistModel(id: "watchlist 1", fundsList: []);
      await localSource.addWatchlist(watchitem);
      //verify or expect
      verify(mockPrefs.setStringList(any, any));
      verify(mockPrefs.setString(any, any));
      // final expected = WatchlistModel(fundsList: [], id: "watchlist 1");
      expect(watchitem, TypeMatcher<WatchlistModel>());
    });

    test("Add watchlist [watchlist 1] when already exsits", () async {
      //assert
      final List<String> watchListString = ["watchlist 1"];
      when(mockPrefs.getStringList(any)).thenReturn(watchListString);
      //act
      final watchitem = WatchlistModel(id: "watchlist 1", fundsList: []);
      final call = localSource.addWatchlist(watchitem);
      //verify or expect
      expect(() async => await call, throwsA(TypeMatcher<CacheException>()));
      verify(mockPrefs.getStringList(any));
    });

    test("Add watchlist [watchlist 1] with funds success", () async {
      //assert
      final List<String> watchListString = [];
      when(mockPrefs.getStringList(any)).thenReturn(watchListString);
      when(mockPrefs.setStringList(any, any)).thenAnswer((_) async => true);
      when(mockPrefs.setString(any, any)).thenAnswer((_) async => true);
      //act
      final watchitem = WatchlistModel(
        id: "watchlist 1",
        fundsList: [FundModel(id: "TATA", navValue: "320.0")],
      );
      await localSource.addWatchlist(watchitem);
      //verify or expect
      verify(mockPrefs.setStringList(any, any));
      verify(mockPrefs.setString(any, any));
      expect(watchitem, TypeMatcher<WatchlistModel>());
    });

    test(
      "Add watchlist [watchlist 1] success but object write failed",
      () async {
        //assert
        final List<String> watchListString = [];
        when(mockPrefs.getStringList(any)).thenReturn(watchListString);
        when(mockPrefs.setStringList(any, any)).thenAnswer((_) async => true);
        when(mockPrefs.setString(any, any)).thenAnswer((_) async => false);
        //act
        final watchitem = WatchlistModel(
          id: "watchlist 1",
          fundsList: [FundModel(id: "TATA", navValue: "320.0")],
        );
        final func = localSource.addWatchlist(watchitem);
        //verify or expect
        expect(() async => await func, throwsA(TypeMatcher<CacheException>()));
        verify(mockPrefs.getStringList(any));
        verify(mockPrefs.setStringList(any, any));
      },
    );

    test("Add watchlist [watchlist 1] failed", () async {
      //assert
      final List<String> watchListString = [];
      when(mockPrefs.getStringList(any)).thenReturn(watchListString);
      when(mockPrefs.setStringList(any, any)).thenAnswer((_) async => false);
      when(mockPrefs.setString(any, any)).thenAnswer((_) async => false);
      //act
      final watchitem = WatchlistModel(
        id: "watchlist 1",
        fundsList: [FundModel(id: "TATA", navValue: "320.0")],
      );
      final func = localSource.addWatchlist(watchitem);
      //verify or expect
      expect(() async => await func, throwsA(TypeMatcher<CacheException>()));
      verify(mockPrefs.getStringList(any));
      verify(mockPrefs.setStringList(any, any));
    });
  });

  group("Update watchlist", () {
    test("Update [watchlist 1] success", () async {
      //assert
      final watchlist1 = jsonEncode({
        "id": "watchlist 1",
        "watchlist 1": [
          {"id": "Tata AIA", "navValue": "120.0"},
          {"id": "SBI Direct", "navValue": "220.0"},
        ],
      });
      when(mockPrefs.getStringList(any)).thenReturn(["watchlist 1"]);
      when(mockPrefs.getString(any)).thenReturn(watchlist1);
      when(mockPrefs.setString(any, any)).thenAnswer((_) async => true);
      //act
      final watchitem = WatchlistModel(
        id: "watchlist 1",
        fundsList: [FundModel(id: "TATA AIA", navValue: "320.0")],
      );
      await localSource.updateWatchlist(watchitem);
      //verify or expect
      verify(mockPrefs.getStringList(any));
      verify(mockPrefs.getString(any));
      verify(mockPrefs.setString(any, any));
    });

    test("Update [watchlist 1] get list failed", () async {
      //assert
      when(mockPrefs.getStringList(any)).thenReturn(null);
      //act
      final watchitem = WatchlistModel(
        id: "watchlist 1",
        fundsList: [FundModel(id: "TATA AIA", navValue: "320.0")],
      );
      final call = localSource.updateWatchlist(watchitem);
      //verify or expect
      expect(() async => await call, throwsA(TypeMatcher<CacheException>()));
      verify(mockPrefs.getStringList(any));
      verifyNoMoreInteractions(mockPrefs);
    });

    test("Update [watchlist 1] failed due to old data error", () async {
      //assert
      when(mockPrefs.getStringList(any)).thenReturn(["watchlist 1"]);
      when(mockPrefs.getString(any)).thenReturn(null);
      when(mockPrefs.setString(any, any)).thenAnswer((_) async => false);
      //act
      final watchitem = WatchlistModel(
        id: "watchlist 1",
        fundsList: [FundModel(id: "TATA AIA", navValue: "320.0")],
      );
      final call = localSource.updateWatchlist(watchitem);
      //verify or expect
      expect(() async => await call, throwsA(TypeMatcher<CacheException>()));
      verify(mockPrefs.getStringList(any));
      verify(mockPrefs.getString(any));
      verifyNoMoreInteractions(mockPrefs);
    });

    test("Update [watchlist 1] failed when saving new data", () async {
      //assert
      final watchlist1 = jsonEncode({
        "id": "watchlist 1",
        "watchlist 1": [
          {"id": "Tata AIA", "navValue": "120.0"},
          {"id": "SBI Direct", "navValue": "220.0"},
        ],
      });
      when(mockPrefs.getStringList(any)).thenReturn(["watchlist 1"]);
      when(mockPrefs.getString(any)).thenReturn(watchlist1);
      when(mockPrefs.setString(any, any)).thenAnswer((_) async => false);
      //act
      final watchitem = WatchlistModel(
        id: "watchlist 1",
        fundsList: [FundModel(id: "TATA AIA", navValue: "320.0")],
      );
      final call = localSource.updateWatchlist(watchitem);
      //verify or expect
      expect(() async => await call, throwsA(TypeMatcher<CacheException>()));
      verify(mockPrefs.getStringList(any));
      verify(mockPrefs.getString(any));
      verify(mockPrefs.setString(any, any));
    });
  });

  group("Delete watchlist", () {
    test("Delete [watchlist 1] success", () async {
      //assert
      when(mockPrefs.getStringList(any)).thenReturn(["watchlist 1"]);
      when(mockPrefs.remove(any)).thenAnswer((_) async => true);
      when(mockPrefs.setStringList(any, any)).thenAnswer((_) async => true);
      //act
      final watchitem = WatchlistModel(
        id: "watchlist 1",
        fundsList: [FundModel(id: "TATA AIA", navValue: "320.0")],
      );
      await localSource.deleteWatchlist(watchitem);
      //verify or expect
      verify(mockPrefs.getStringList(any));
      verify(mockPrefs.remove(any));
      verify(mockPrefs.setStringList(any, any));
    });

    test("Delete [watchlist 1] get failed", () async {
      //assert
      when(mockPrefs.getStringList(any)).thenReturn(null);
      //act
      final watchitem = WatchlistModel(
        id: "watchlist 1",
        fundsList: [FundModel(id: "TATA AIA", navValue: "320.0")],
      );
      final call = localSource.deleteWatchlist(watchitem);
      //verify or expect
      expect(() async => await call, throwsA(TypeMatcher<CacheException>()));
      verify(mockPrefs.getStringList(any));
    });

    test("Delete [watchlist 1] get but removing prefs failed", () async {
      //assert
      when(mockPrefs.getStringList(any)).thenReturn(["watchlist 1"]);
      when(mockPrefs.remove(any)).thenAnswer((_) async => false);
      //act
      final watchitem = WatchlistModel(
        id: "watchlist 1",
        fundsList: [FundModel(id: "TATA AIA", navValue: "320.0")],
      );
      final call = localSource.deleteWatchlist(watchitem);
      //verify or expect
      expect(() async => await call, throwsA(TypeMatcher<CacheException>()));
      verify(mockPrefs.getStringList(any));
      verify(mockPrefs.remove(any));
    });

    test(
      "Delete [watchlist 1] get, removed prefs, buu list update failed",
      () async {
        //assert
        when(mockPrefs.getStringList(any)).thenReturn(["watchlist 1"]);
        when(mockPrefs.remove(any)).thenAnswer((_) async => true);
        when(mockPrefs.setStringList(any, any)).thenAnswer((_) async => false);
        //act
        final watchitem = WatchlistModel(
          id: "watchlist 1",
          fundsList: [FundModel(id: "TATA AIA", navValue: "320.0")],
        );
        final call = localSource.deleteWatchlist(watchitem);
        //verify or expect
        expect(() async => await call, throwsA(TypeMatcher<CacheException>()));
        verify(mockPrefs.getStringList(any));
        verify(mockPrefs.remove(any));
        verifyNever(mockPrefs.setStringList(any, any));
      },
    );
  });
}
