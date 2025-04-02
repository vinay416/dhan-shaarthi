import 'package:dartz/dartz.dart';

import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/watchlist/data/data_source/watchlist_local_data_source.dart';

import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';

import '../../domain/repository/watchlist_repository.dart';

class WatchlistRepositoryImpl implements WatchlistRepository {
  const WatchlistRepositoryImpl({required this.localDataSource});
  final WatchlistLocalDataSource localDataSource;

  @override
  Future<Either<Failure, Unit>> addWatchlist(WatchlistEntity watchlist) async {
    try {
      await localDataSource.addWatchlist(watchlist);
      return Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteWatchlist(
    WatchlistEntity watchlist,
  ) async {
    try {
      await localDataSource.deleteWatchlist(watchlist);
      return Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<WatchlistEntity>>> getWatchlist() async {
    try {
      final watchlist = await localDataSource.getWatchlist();
      return Right(watchlist);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> updateWatchlist(
    WatchlistEntity watchlist,
  ) async {
    try {
      await localDataSource.updateWatchlist(watchlist);
      return Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
