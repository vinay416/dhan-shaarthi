import 'dart:convert';

import 'package:dhan_saarthi/core/exceptions.dart';
import 'package:dhan_saarthi/feature/watchlist/data/models/watchlist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class WatchlistLocalDataSource {
  Future<List<WatchlistModel>> getWatchlist();
  Future<void> addWatchlist(WatchlistModel watchlist);
  Future<void> updateWatchlist(WatchlistModel watchlist);
  Future<void> deleteWatchlist(WatchlistModel watchlist);
}

// ignore: constant_identifier_names
const String WATCHLIST_PREFS_KEY = "WATCHLIST_PREFS_KEY";

class WatchlistLocalDataSourceImpl implements WatchlistLocalDataSource {
  const WatchlistLocalDataSourceImpl(this.preferences);
  final SharedPreferences preferences;
  @override
  Future<void> addWatchlist(WatchlistModel watchlist) async {
    //Updating/Adding main Ids String List
    final stringWatchList =
        preferences.getStringList(WATCHLIST_PREFS_KEY) ?? [];
    final watchListId = watchlist.id;
    final List<String> newStringList = [...stringWatchList, watchListId];
    final success = await preferences.setStringList(
      WATCHLIST_PREFS_KEY,
      newStringList,
    );
    if (!success) throw CacheException();

    //Adding Object
    final encodedJson = jsonEncode(watchlist.toMap());
    final objectSuccess = await preferences.setString(watchListId, encodedJson);
    if (!objectSuccess) throw CacheException();
  }

  @override
  Future<void> deleteWatchlist(WatchlistModel watchlist) async {
    final oldWatchList = preferences.getStringList(WATCHLIST_PREFS_KEY) ?? [];
    if (oldWatchList.isEmpty) throw CacheException();

    final dataDeleted = await preferences.remove(watchlist.id);
    if (!dataDeleted) throw CacheException();

    oldWatchList.remove(watchlist.id);
    final newWatchlist = [...oldWatchList];
    final isUpdated = await preferences.setStringList(
      WATCHLIST_PREFS_KEY,
      newWatchlist,
    );
    if (!isUpdated) throw CacheException();
  }

  @override
  Future<List<WatchlistModel>> getWatchlist() async {
    final List<WatchlistModel> watchlist = [];
    final stringWatchList =
        preferences.getStringList(WATCHLIST_PREFS_KEY) ?? [];

    for (String id in stringWatchList) {
      final fund = preferences.getString(id) ?? "{}";
      final Map<String, dynamic> jecodedJson = jsonDecode(fund);
      if (jecodedJson.isEmpty) continue;
      final watchItem = WatchlistModel.fromJson(jecodedJson);
      watchlist.add(watchItem);
    }

    return watchlist;
  }

  @override
  Future<void> updateWatchlist(WatchlistModel watchlist) async {
    final oldDataString = preferences.getString(watchlist.id);
    if (oldDataString == null) throw CacheException();

    final newWatchlistString = jsonEncode(watchlist.toMap());
    final success = await preferences.setString(
      watchlist.id,
      newWatchlistString,
    );
    if (!success) throw CacheException();
  }
}
