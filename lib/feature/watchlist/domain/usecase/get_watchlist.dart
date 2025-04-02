import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/repository/watchlist_repository.dart';

class GetWatchlist {
  const GetWatchlist({required this.repo});
  final WatchlistRepository repo;

  Future<Either<Failure, List<WatchlistEntity>>> call() async {
    return await repo.getWatchlist();
  }
}
