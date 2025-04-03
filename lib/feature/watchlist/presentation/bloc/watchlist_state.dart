part of 'watchlist_bloc.dart';

sealed class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object> get props => [];
}

final class WatchlistLoading extends WatchlistState {}

final class WatchlistLoaded extends WatchlistState {
  const WatchlistLoaded(this.watchList);
  final List<WatchlistEntity> watchList;

  @override
  List<Object> get props => [watchList];
}

final class WatchlistAdded extends WatchlistState {}

final class LoadingAddWatchlist extends WatchlistState {}

final class AddWatchlistFailed extends WatchlistState {}
