import 'package:dhan_saarthi/feature/watchlist/domain/enities/fund_entity.dart';

class FundModel extends FundEntity {
  const FundModel({required super.name, required super.navValue});

  factory FundModel.fromEntity(FundEntity entity) {
    return FundModel(name: entity.name, navValue: entity.navValue);
  }

  factory FundModel.fromJson(Map<String, dynamic> json) {
    return FundModel(name: json["name"], navValue: json["navValue"]);
  }

  Map<String, dynamic> toMap() {
    return {"name": name, "navValue": navValue};
  }
}
