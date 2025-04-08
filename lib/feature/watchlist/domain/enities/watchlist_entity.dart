import 'package:dhan_saarthi/feature/watchlist/domain/enities/fund_entity.dart';
import 'package:equatable/equatable.dart';

class WatchlistEntity extends Equatable {
  const WatchlistEntity({required this.id, required this.fundsList});
  final String id; //as name
  final List<FundEntity> fundsList;

  @override
  List<Object?> get props => [id, fundsList];

  factory WatchlistEntity.empty() {
    return WatchlistEntity(id: "", fundsList: []);
  }
}
