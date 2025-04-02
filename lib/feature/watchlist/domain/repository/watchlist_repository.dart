import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';

import '../enities/watchlist_entity.dart';

abstract class WatchlistRepository {
  Future<Either<Failure, List<WatchlistEntity>>> getWatchlist();
  Future<Either<Failure, Unit>> addWatchlist(WatchlistEntity watchlist);
  Future<Either<Failure, Unit>> updateWatchlist(WatchlistEntity watchlist);
  Future<Either<Failure, Unit>> deleteWatchlist(WatchlistEntity watchlist);
}
