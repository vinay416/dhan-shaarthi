import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/repository/watchlist_repository.dart';

class AddWatchlist {
  const AddWatchlist({required this.repo});
  final WatchlistRepository repo;

  Future<Either<Failure, Unit>> call(String watchlist) async {
    return await repo.addWatchlist(watchlist);
  }
}
