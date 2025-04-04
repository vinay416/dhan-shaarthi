import 'dart:convert';

import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:dhan_saarthi/feature/watchlist/data/data_source/watchlist_local_data_source.dart';
import 'package:dhan_saarthi/feature/watchlist/data/models/fund_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../core/prefs_mock/mock_shared_prefs.mocks.dart';

void main() {
  final mockPrefs = MockSharedPrefs();
  final localSource = WatchlistLocalDataSourceImpl(mockPrefs);

  group("Get Watchlist", () {
    test("Get watchlist success", () async {
      //assert
      final watchListString = ["watchlist 1"];
      when(
        mockPrefs.getStringList(WATCHLIST_PREFS_KEY),
      ).thenReturn(watchListString);
      final jsonFundString = ['{"name":"Tata AIA","navValue":"320.0"}'];
      when(mockPrefs.getStringList("watchlist 1")).thenReturn(jsonFundString);
      //act
      await localSource.getWatchlist();
      //verify or expect
      await untilCalled(mockPrefs.getStringList(WATCHLIST_PREFS_KEY));
      await untilCalled(mockPrefs.getStringList("watchlist 1"));
      verify(mockPrefs.getStringList(WATCHLIST_PREFS_KEY));
      verify(mockPrefs.getStringList("watchlist 1"));
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
      when(
        mockPrefs.getStringList(WATCHLIST_PREFS_KEY),
      ).thenReturn(watchListString);
      when(mockPrefs.getStringList("watchlist 1")).thenReturn(null);
      //act
      await localSource.getWatchlist();
      //verify or expect
      await untilCalled(mockPrefs.getStringList(WATCHLIST_PREFS_KEY));
      await untilCalled(mockPrefs.getStringList("watchlist 1"));
      verify(mockPrefs.getStringList(WATCHLIST_PREFS_KEY));
      verify(mockPrefs.getStringList("watchlist 1"));
    });
  });

  group("Add Watchlist", () {
    test("Add watchlist success", () async {
      //assert
      when(mockPrefs.getStringList(any)).thenReturn(null);
      when(mockPrefs.setStringList(any, any)).thenAnswer((_) async => true);
      //act
      await localSource.addWatchlist("watchlist 1");
      //verify or expect
      verify(mockPrefs.getStringList(any));
      verify(mockPrefs.setStringList(any, any));
    });

    test("Add watchlist, already exist", () async {
      //assert
      when(mockPrefs.getStringList(any)).thenReturn(["watchlist 1"]);
      //act
      final call = localSource.addWatchlist("watchlist 1");
      //verify or expect
      expect(() async => await call, throwsA(TypeMatcher<CacheException>()));
      verify(mockPrefs.getStringList(any));
    });

    test("Add watchlist failed", () async {
      //assert
      when(mockPrefs.getStringList(any)).thenReturn(null);
      when(mockPrefs.setStringList(any, any)).thenAnswer((_) async => false);
      //act
      final call = localSource.addWatchlist("watchlist 1");
      //verify or expect
      expect(() async => await call, throwsA(TypeMatcher<CacheException>()));
      verify(mockPrefs.getStringList(any));
      verify(mockPrefs.setStringList(any, any));
    });
  });

  group("Add fund to watchlist", () {
    test("Add fund success to watchlist", () async {
      //assert
      when(
        mockPrefs.getStringList(WATCHLIST_PREFS_KEY),
      ).thenReturn(["watchlist 1"]);
      when(mockPrefs.getStringList("watchlist 1")).thenReturn(null);
      when(
        mockPrefs.setStringList("watchlist 1", any),
      ).thenAnswer((_) async => true);
      //act
      final fund = FundModel(name: "TATA", navValue: "320.0");
      await localSource.addFund(watchlist: "watchlist 1", fund: fund);
      //verify or expect
      verify(mockPrefs.getStringList(WATCHLIST_PREFS_KEY));
      verify(mockPrefs.getStringList("watchlist 1"));
      verify(mockPrefs.setStringList("watchlist 1", any));
    });

    test("Add fund already in watchlist", () async {
      //assert
      when(
        mockPrefs.getStringList(WATCHLIST_PREFS_KEY),
      ).thenReturn(["watchlist 1"]);
      final jsonString = ['{"name":"Tata AIA","navValue":"320.0"}'];
      when(mockPrefs.getStringList("watchlist 1")).thenReturn(jsonString);
      when(mockPrefs.setStringList(any, any)).thenAnswer((_) async => false);
      //act
      final fund = FundModel(name: "TATA AIA", navValue: "320.0");
      final call = localSource.addFund(watchlist: "watchlist 1", fund: fund);
      //verify or expect
      expect(() async => call, throwsA(TypeMatcher<CacheException>()));
      verify(mockPrefs.getStringList(WATCHLIST_PREFS_KEY));
      verify(mockPrefs.getStringList("watchlist 1"));
      verifyNoMoreInteractions(mockPrefs);
    });
  });

  group("Update watchlist", () {
    test("Update name success", () async {
      //assert
      when(
        mockPrefs.getStringList(WATCHLIST_PREFS_KEY),
      ).thenReturn(["watchlist 1"]);
      when(
        mockPrefs.setStringList(WATCHLIST_PREFS_KEY, any),
      ).thenAnswer((_) async => true);
      final jsonString = ['{"name":"Tata AIA","navValue":"320.0"}'];
      when(mockPrefs.getStringList("watchlist 1")).thenReturn(jsonString);
      when(
        mockPrefs.setStringList("watchlist", any),
      ).thenAnswer((_) async => true);
      when(mockPrefs.remove(any)).thenAnswer((_) async => true);
      //act
      await localSource.updateWatchlist(
        oldName: "watchlist 1",
        newName: "watchlist",
      );
      //verify or expect
      verify(mockPrefs.getStringList(WATCHLIST_PREFS_KEY));
      verify(mockPrefs.setStringList(WATCHLIST_PREFS_KEY, any));
      verify(mockPrefs.getStringList("watchlist 1"));
      verify(mockPrefs.setStringList("watchlist", any));
    });

    test("Update name [watchlist 1] List failure", () async {
      //assert
      when(
        mockPrefs.getStringList(WATCHLIST_PREFS_KEY),
      ).thenReturn(["watchlist 1"]);
      when(
        mockPrefs.setStringList(WATCHLIST_PREFS_KEY, any),
      ).thenAnswer((_) async => false);
      final jsonString = ['{"name":"Tata AIA","navValue":"320.0"}'];
      when(mockPrefs.getStringList("watchlist 1")).thenReturn(jsonString);
      when(
        mockPrefs.setStringList("watchlist", any),
      ).thenAnswer((_) async => false);
      //act
      final call = localSource.updateWatchlist(
        oldName: "watchlist 1",
        newName: "watchlist",
      );
      //verify or expect
      verify(mockPrefs.getStringList(WATCHLIST_PREFS_KEY));
      verify(mockPrefs.setStringList(WATCHLIST_PREFS_KEY, any));
      verifyNoMoreInteractions(mockPrefs);
      expect(() async => call, throwsA(TypeMatcher<CacheException>()));
    });

    test("Update name [watchlist 1] updating failed", () async {
      //assert
      when(
        mockPrefs.getStringList(WATCHLIST_PREFS_KEY),
      ).thenReturn(["watchlist 1"]);
      when(
        mockPrefs.setStringList(WATCHLIST_PREFS_KEY, any),
      ).thenAnswer((_) async => true);
      final jsonString = ['{"name":"Tata AIA","navValue":"320.0"}'];
      when(mockPrefs.getStringList("watchlist 1")).thenReturn(jsonString);
      when(
        mockPrefs.setStringList("watchlist", any),
      ).thenAnswer((_) async => false);
      when(mockPrefs.remove(any)).thenAnswer((_) async => true);
      //act
      final call = localSource.updateWatchlist(
        oldName: "watchlist 1",
        newName: "watchlist",
      );
      //verify or expect
      await untilCalled(mockPrefs.setStringList(WATCHLIST_PREFS_KEY, any));

      verify(mockPrefs.getStringList(WATCHLIST_PREFS_KEY));
      verify(mockPrefs.setStringList(WATCHLIST_PREFS_KEY, any));
      verify(mockPrefs.getStringList("watchlist 1"));
      verify(mockPrefs.setStringList("watchlist", any));
      expect(() async => await call, throwsA(TypeMatcher<CacheException>()));
    });
  });

  group("Delete watchlist", () {
    test("Delete watchlist 1 success", () async {
      //assert
      when(
        mockPrefs.getStringList(WATCHLIST_PREFS_KEY),
      ).thenReturn(["watchlist 1"]);
      when(
        mockPrefs.setStringList(WATCHLIST_PREFS_KEY, any),
      ).thenAnswer((_) async => true);
      when(mockPrefs.remove("watchlist 1")).thenAnswer((_) async => true);
      //act
      await localSource.deleteWatchlist("watchlist 1");
      //verify or expect
      await untilCalled(mockPrefs.setStringList(WATCHLIST_PREFS_KEY, any));
      verify(mockPrefs.getStringList(WATCHLIST_PREFS_KEY));
      verify(mockPrefs.setStringList(WATCHLIST_PREFS_KEY, any));
      verify(mockPrefs.remove("watchlist 1"));
    });

    test("Delete watchlist 1 failure", () async {
      //assert
      when(
        mockPrefs.getStringList(WATCHLIST_PREFS_KEY),
      ).thenReturn(["watchlist 1"]);
      when(
        mockPrefs.setStringList(WATCHLIST_PREFS_KEY, any),
      ).thenAnswer((_) async => false);
      when(mockPrefs.remove("watchlist 1")).thenAnswer((_) async => true);
      //act
      final call = localSource.deleteWatchlist("watchlist 1");
      //verify or expect
      verify(mockPrefs.getStringList(WATCHLIST_PREFS_KEY));
      verify(mockPrefs.setStringList(WATCHLIST_PREFS_KEY, any));
      expect(() async => await call, throwsA(TypeMatcher<CacheException>()));
    });
  });

  group("Delete Fund", () {
    test("Delete fund in watchlist 1 success", () async {
      //assert
      final jsonString = ['{"name":"Tata AIA","navValue":"320.0"}'];
      when(mockPrefs.getStringList("watchlist 1")).thenReturn(jsonString);
      when(
        mockPrefs.setStringList("watchlist 1", any),
      ).thenAnswer((_) async => true);
      //act
      final fund = FundModel.fromJson(jsonDecode(jsonString.first));
      await localSource.deleteFund(watchlist: "watchlist 1", fund: fund);
      //verify or expect
      verify(mockPrefs.getStringList("watchlist 1"));
      verify(mockPrefs.setStringList("watchlist 1", any));
      verifyNoMoreInteractions(mockPrefs);
    });

    test("Delete fund in watchlist 1 failed", () async {
      //assert
      final jsonString = ['{"name":"Tata AIA","navValue":"320.0"}'];
      when(mockPrefs.getStringList("watchlist 1")).thenReturn(jsonString);
      when(
        mockPrefs.setStringList("watchlist 1", any),
      ).thenAnswer((_) async => false);
      //act
      final fund = FundModel.fromJson(jsonDecode(jsonString.first));
      final call = localSource.deleteFund(watchlist: "watchlist 1", fund: fund);
      //verify or expect
      verify(mockPrefs.getStringList("watchlist 1"));
      verify(mockPrefs.setStringList("watchlist 1", any));
      verifyNoMoreInteractions(mockPrefs);
      expect(() async => await call, throwsA(TypeMatcher<CacheException>()));
    });
  });
}
