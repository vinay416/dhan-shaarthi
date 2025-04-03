import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/fund_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/repository/watchlist_repository.dart';

class DeleteWatchlistFund {
  const DeleteWatchlistFund({required this.repo});
  final WatchlistRepository repo;

  Future<Either<Failure, Unit>> call({
    required String watchlist,
    required FundEntity fund,
  }) async {
    return await repo.deleteFund(watchlist: watchlist, fund: fund);
  }
}
