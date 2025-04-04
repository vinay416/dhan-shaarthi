part of 'watchlist_bloc.dart';

sealed class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List<Object> get props => [];
}

final class InitWatchlistEvent extends WatchlistEvent {}

final class CreateWatchlistEvent extends WatchlistEvent {
  const CreateWatchlistEvent(this.name);
  final String name;

  @override
  List<Object> get props => [name];
}

final class ChangeWatchlistNameEvent extends WatchlistEvent {
  const ChangeWatchlistNameEvent({
    required this.oldName,
    required this.newName,
  });
  final String oldName;
  final String newName;

  @override
  List<Object> get props => [oldName, newName];
}

final class DeleteWatchlistEvent extends WatchlistEvent {
  const DeleteWatchlistEvent(this.name);
  final String name;

  @override
  List<Object> get props => [name];
}

final class AddFundWatchlistEvent extends WatchlistEvent {
  const AddFundWatchlistEvent({required this.watchlist, required this.fund});
  final String watchlist;
  final FundEntity fund;

  @override
  List<Object> get props => [watchlist, fund];
}

final class DeleteFundWatchlistEvent extends WatchlistEvent {
  const DeleteFundWatchlistEvent({required this.watchlist, required this.fund});
  final String watchlist;
  final FundEntity fund;

  @override
  List<Object> get props => [watchlist, fund];
}
