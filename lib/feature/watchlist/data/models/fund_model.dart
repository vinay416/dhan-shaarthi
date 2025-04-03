import 'package:dhan_saarthi/feature/watchlist/domain/enities/fund_entity.dart';

class FundModel extends FundEntity {
  const FundModel({required super.id, required super.navValue});

  factory FundModel.fromEntity(FundEntity entity) {
    return FundModel(id: entity.id, navValue: entity.navValue);
  }

  factory FundModel.fromJson(Map<String, dynamic> json) {
    return FundModel(id: json["id"], navValue: json["navValue"]);
  }

  Map<String, dynamic> toMap() {
    return {"id": id, "navValue": navValue};
  }
}
