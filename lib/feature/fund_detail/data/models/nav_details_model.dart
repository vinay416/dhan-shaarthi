import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/nav_entity.dart';

import 'graph_data_model.dart';

class NavDetailsModel extends NavEntity {
  const NavDetailsModel({required super.lineGraphData, required super.name});

  factory NavDetailsModel.fromJson(Map<String, dynamic> json) {
    final String name = json["fund"] ?? "N/A";
    final List graphData = json["nav_data"] ?? [];
    final lineGraphData =
        graphData.map((e) => GraphDataModel.fromJson(e)).toList();

    return NavDetailsModel(lineGraphData: lineGraphData, name: name);
  }
}
