import 'dart:convert';

import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:dhan_saarthi/feature/watchlist/data/models/fund_model.dart';
import 'package:dhan_saarthi/feature/watchlist/data/models/watchlist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class WatchlistLocalDataSource {
  Future<List<WatchlistModel>> getWatchlist();
  Future<void> addWatchlist(String watchlist);
  Future<void> updateWatchlist({
    required String oldName,
    required String newName,
  });
  Future<void> deleteWatchlist(String watchlist);
  Future<void> addFund({required String watchlist, required FundModel fund});
  Future<void> deleteFund({required String watchlist, required FundModel fund});
}

// ignore: constant_identifier_names
const String WATCHLIST_PREFS_KEY = "WATCHLIST_PREFS_KEY";

class WatchlistLocalDataSourceImpl implements WatchlistLocalDataSource {
  const WatchlistLocalDataSourceImpl(this.preferences);
  final SharedPreferences preferences;

  @override
  Future<void> addWatchlist(String watchlist) async {
    final stringWatchList =
        preferences.getStringList(WATCHLIST_PREFS_KEY) ?? [];
    if (stringWatchList.contains(watchlist)) {
      throw CacheException(msg: "$watchlist already exsist!");
    }

    final List<String> newStringList = [...stringWatchList, watchlist];
    final success = await preferences.setStringList(
      WATCHLIST_PREFS_KEY,
      newStringList,
    );
    if (!success) throw CacheException(msg: "Saving failed!");
  }

  @override
  Future<void> deleteWatchlist(String watchlist) async {
    final oldWatchList = preferences.getStringList(WATCHLIST_PREFS_KEY) ?? [];
    if (oldWatchList.isEmpty) {
      throw CacheException(msg: "Watchlist ID not found!");
    }

    oldWatchList.remove(watchlist);
    final newWatchlist = [...oldWatchList];
    final isUpdated = await preferences.setStringList(
      WATCHLIST_PREFS_KEY,
      newWatchlist,
    );
    if (!isUpdated) throw CacheException(msg: "Updating failed!");

    preferences.remove(watchlist);
  }

  @override
  Future<List<WatchlistModel>> getWatchlist() async {
    final List<WatchlistModel> watchlist = [];
    final stringWatchList =
        preferences.getStringList(WATCHLIST_PREFS_KEY) ?? [];

    for (String id in stringWatchList) {
      final funds = preferences.getStringList(id) ?? [];
      final fundsList =
          funds.map((e) => FundModel.fromJson(jsonDecode(e))).toList();
      final watchItem = WatchlistModel(id: id, fundsList: fundsList);
      watchlist.add(watchItem);
    }

    return watchlist;
  }

  @override
  Future<void> updateWatchlist({
    required String oldName,
    required String newName,
  }) async {
    final oldWatchList = preferences.getStringList(WATCHLIST_PREFS_KEY) ?? [];
    if (!oldWatchList.contains(oldName)) {
      throw CacheException(msg: "Watchlist ID not found!");
    }

    final updatedWatchList = _replaceItemAtIndex(
      oldWatchList: oldWatchList,
      oldName: oldName,
      newName: newName,
    );
    final updateListSuccess = await preferences.setStringList(
      WATCHLIST_PREFS_KEY,
      updatedWatchList,
    );
    if (!updateListSuccess) throw CacheException(msg: "Updating failed!");

    final fundDataList = preferences.getStringList(oldName) ?? [];

    final success = await preferences.setStringList(newName, fundDataList);
    if (!success) throw CacheException(msg: "Updating name failed!");
    preferences.remove(oldName);
  }

  List<String> _replaceItemAtIndex({
    required List<String> oldWatchList,
    required String oldName,
    required String newName,
  }) {
    final int index = oldWatchList.indexOf(oldName);
    if (index < 0) throw CacheException(msg: "Old Item index $index");

    oldWatchList.remove(oldName);
    final updatedWatchList = [...oldWatchList];
    updatedWatchList.insert(index, newName);
    return updatedWatchList;
  }

  @override
  Future<void> addFund({
    required String watchlist,
    required FundModel fund,
  }) async {
    final watchStringList =
        preferences.getStringList(WATCHLIST_PREFS_KEY) ?? [];
    if (!watchStringList.contains(watchlist)) {
      throw CacheException(msg: "Watchlist ID not found!");
    }

    final fundsList = preferences.getStringList(watchlist) ?? [];
    final oldFunds =
        fundsList.map((e) => FundModel.fromJson(jsonDecode(e))).toList();
    final isExsist =
        oldFunds
            .where((e) => e.name.toLowerCase() == fund.name.toLowerCase())
            .toList()
            .isNotEmpty;

    if (isExsist) throw CacheException(msg: "${fund.name} already exsist!");

    final fundString = jsonEncode(fund.toMap());
    final added = await preferences.setStringList(watchlist, [
      ...fundsList,
      fundString,
    ]);
    if (!added) throw CacheException(msg: "Saving failed!");
  }

  @override
  Future<void> deleteFund({
    required String watchlist,
    required FundModel fund,
  }) async {
    final fundsTringList = preferences.getStringList(watchlist) ?? [];
    final oldFunds =
        fundsTringList.map((e) => FundModel.fromJson(jsonDecode(e))).toList();
    final isExsist =
        oldFunds
            .where((e) => e.name.toLowerCase() == fund.name.toLowerCase())
            .toList()
            .isNotEmpty;
    if (!isExsist) throw CacheException(msg: "Fund ID not found!");

    oldFunds.removeWhere(
      (e) => e.name.toLowerCase() == fund.name.toLowerCase(),
    );
    final newFundsJson = oldFunds.map((e) => jsonEncode(e.toMap())).toList();
    final success = await preferences.setStringList(watchlist, newFundsJson);
    if (!success) throw CacheException(msg: "Updating failed!");
  }
}
