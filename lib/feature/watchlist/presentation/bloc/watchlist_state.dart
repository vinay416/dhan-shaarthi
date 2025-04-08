part of 'watchlist_bloc.dart';

sealed class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object> get props => [];
}

//INIT STATE
final class WatchlistLoading extends WatchlistState {}

final class WatchlistLoaded extends WatchlistState {
  const WatchlistLoaded(this.watchList);
  final List<WatchlistEntity> watchList;

  @override
  List<Object> get props => [watchList];
}

// //CREATE NEW WATCHLIST
// final class AddWatchlistLoading extends WatchlistState {}

// final class WatchlistAdded extends WatchlistState {}

// final class AddWatchlistFailed extends WatchlistState {}

// //UPDATE WATCHLIST NAME
// final class WatchlistNameUpdated extends WatchlistState {}

// final class WatchlistNameUpdateFailed extends WatchlistState {}

// //DELETE WATCHLIST
// final class DeleteWatchlistLoading extends WatchlistState {}

// final class DeletedWatchlist extends WatchlistState {}

// final class DeleteWatchlistFailed extends WatchlistState {}

//ADD FUND TO WATCHLIST
final class AddFundWatchlistLoading extends WatchlistState {}

final class AddedFundWatchlist extends WatchlistState {}

final class AddFundWatchlistFailure extends WatchlistState {}

//DELETE FUND TO WATCHLIST
final class DeleteFundWatchlistLoading extends WatchlistState {}

final class DeletedFundWatchlist extends WatchlistState {}

final class DeleteFundWatchlistFailure extends WatchlistState {}
