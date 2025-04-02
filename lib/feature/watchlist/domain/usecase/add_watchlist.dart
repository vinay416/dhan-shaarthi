import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/repository/watchlist_repository.dart';

import '../enities/watchlist_entity.dart';

class AddWatchlist {
  const AddWatchlist({required this.repo});
  final WatchlistRepository repo;

  Future<Either<Failure, Unit>> call(WatchlistEntity watchlist) async {
    return await repo.addWatchlist(watchlist);
  }
}
