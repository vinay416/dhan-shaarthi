import '../../domain/enities/watchlist_entity.dart';

abstract class WatchlistLocalDataSource {
  Future<List<WatchlistEntity>> getWatchlist();
  Future<void> addWatchlist(WatchlistEntity watchlist);
  Future<void> updateWatchlist(WatchlistEntity watchlist);
  Future<void> deleteWatchlist(WatchlistEntity watchlist);
}
