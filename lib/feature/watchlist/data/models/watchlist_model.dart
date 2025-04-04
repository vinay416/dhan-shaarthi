import 'package:dhan_saarthi/feature/watchlist/data/models/fund_model.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';

class WatchlistModel extends WatchlistEntity {
  const WatchlistModel({required super.id, required super.fundsList});

  factory WatchlistModel.fromJson(Map<String, dynamic> json) {
    final String id = json["id"];
    final List list = json[id] ?? [];
    return WatchlistModel(
      id: id,
      fundsList: list.map((e) => FundModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      id: fundsList.map((e) => (e as FundModel).toMap()).toList(),
    };
  }
}
