import 'package:dhan_saarthi/feature/watchlist/data/models/fund_model.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';

class WatchlistModel extends WatchlistEntity {
  const WatchlistModel({required super.id, required super.fundsList});

  factory WatchlistModel.fromJson(Map<String, dynamic> json) {
    final List list = json["fundsList"] ?? [];

    return WatchlistModel(
      id: json["id"],
      fundsList: list.map((e) => FundModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "fundsList": fundsList.map((e) => (e as FundModel).toMap()).toList(),
    };
  }
}
