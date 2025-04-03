part of 'watchlist_bloc.dart';

sealed class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List<Object> get props => [];
}

final class InitWatchlist extends WatchlistEvent {}

final class CreateWatchlist extends WatchlistEvent {}
