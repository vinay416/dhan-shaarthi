part of 'manage_watchlist_bloc.dart';

sealed class ManageWatchlistState extends Equatable {
  const ManageWatchlistState();

  @override
  List<Object> get props => [];
}

final class InitialManageWatchList extends ManageWatchlistState {}

//CREATE NEW WATCHLIST
final class AddWatchlistLoading extends ManageWatchlistState {}

final class WatchlistAdded extends ManageWatchlistState {}

final class AddWatchlistFailed extends ManageWatchlistState {}

//UPDATE WATCHLIST NAME
final class WatchlistNameUpdated extends ManageWatchlistState {}

final class WatchlistNameUpdateFailed extends ManageWatchlistState {}

//DELETE WATCHLIST
final class DeleteWatchlistLoading extends ManageWatchlistState {}

final class DeletedWatchlist extends ManageWatchlistState {}

final class DeleteWatchlistFailed extends ManageWatchlistState {}
