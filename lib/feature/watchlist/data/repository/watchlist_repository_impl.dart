import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/exceptions.dart';

import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/watchlist/data/data_source/watchlist_local_data_source.dart';
import 'package:dhan_saarthi/feature/watchlist/data/models/fund_model.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/fund_entity.dart';

import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';

import '../../domain/repository/watchlist_repository.dart';

class WatchlistRepositoryImpl implements WatchlistRepository {
  const WatchlistRepositoryImpl({required this.localDataSource});
  final WatchlistLocalDataSource localDataSource;

  @override
  Future<Either<Failure, Unit>> addWatchlist(String watchlist) async {
    try {
      await localDataSource.addWatchlist(watchlist);
      return Right(unit);
    } on CacheException catch (e) {
      return Left(CacheFailure(msg: e.msg ?? "Cache failure"));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteWatchlist(String watchlist) async {
    try {
      await localDataSource.deleteWatchlist(watchlist);
      return Right(unit);
    } on CacheException catch (e) {
      return Left(CacheFailure(msg: e.msg ?? "Cache failure"));
    }
  }

  @override
  Future<Either<Failure, List<WatchlistEntity>>> getWatchlist() async {
    try {
      final watchlist = await localDataSource.getWatchlist();
      return Right(watchlist);
    } on CacheException catch (e) {
      return Left(CacheFailure(msg: e.msg ?? "Cache failure"));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateWatchlist({
    required String oldName,
    required String newName,
  }) async {
    try {
      await localDataSource.updateWatchlist(oldName: oldName, newName: newName);
      return Right(unit);
    } on CacheException catch (e) {
      return Left(CacheFailure(msg: e.msg ?? "Cache failure"));
    }
  }

  @override
  Future<Either<Failure, Unit>> addFund({
    required String watchlist,
    required FundEntity fund,
  }) async {
    try {
      await localDataSource.addFund(
        watchlist: watchlist,
        fund: FundModel.fromEntity(fund),
      );
      return Right(unit);
    } on CacheException catch (e) {
      return Left(CacheFailure(msg: e.msg ?? "Cache failure"));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteFund({
    required String watchlist,
    required FundEntity fund,
  }) async {
    try {
      await localDataSource.deleteFund(
        watchlist: watchlist,
        fund: FundModel.fromEntity(fund),
      );
      return Right(unit);
    } on CacheException catch (e) {
      return Left(CacheFailure(msg: e.msg ?? "Cache failure"));
    }
  }
}
