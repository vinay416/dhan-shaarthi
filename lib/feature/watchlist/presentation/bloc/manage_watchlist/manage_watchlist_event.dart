part of 'manage_watchlist_bloc.dart';

sealed class ManageWatchlistEvent extends Equatable {
  const ManageWatchlistEvent();

  @override
  List<Object> get props => [];
}

final class CreateWatchlistEvent extends ManageWatchlistEvent {
  const CreateWatchlistEvent(this.name);
  final String name;

  @override
  List<Object> get props => [name];
}

final class ChangeWatchlistNameEvent extends ManageWatchlistEvent {
  const ChangeWatchlistNameEvent({
    required this.oldName,
    required this.newName,
  });
  final String oldName;
  final String newName;

  @override
  List<Object> get props => [oldName, newName];
}

final class DeleteWatchlistEvent extends ManageWatchlistEvent {
  const DeleteWatchlistEvent(this.name);
  final String name;

  @override
  List<Object> get props => [name];
}
