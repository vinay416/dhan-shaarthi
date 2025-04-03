import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/repository/watchlist_repository.dart';

class UpdateWatchlist {
  const UpdateWatchlist({required this.repo});
  final WatchlistRepository repo;

  Future<Either<Failure, Unit>> call({
    required String oldName,
    required String newName,
  }) async {
    return await repo.updateWatchlist(oldName: oldName, newName: newName);
  }
}
