import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/fund_entity.dart';

import '../enities/watchlist_entity.dart';

abstract class WatchlistRepository {
  Future<Either<Failure, List<WatchlistEntity>>> getWatchlist();
  Future<Either<Failure, Unit>> addWatchlist(String watchlist);
  Future<Either<Failure, Unit>> updateWatchlist({
    required String oldName,
    required String newName,
  });
  Future<Either<Failure, Unit>> deleteWatchlist(String watchlist);

  Future<Either<Failure, Unit>> addFund({
    required String watchlist,
    required FundEntity fund,
  });
  Future<Either<Failure, Unit>> deleteFund({
    required String watchlist,
    required FundEntity fund,
  });
}
