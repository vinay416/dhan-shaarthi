import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/fund_performace_enity.dart';

import 'bar_graph_model.dart';

class FundPerformaceModel extends FundPerformaceEntity {
  const FundPerformaceModel({required super.name, required super.graphData});

  factory FundPerformaceModel.fromJson(Map<String, dynamic> json) {
    final List graph = json["graph_data"] ?? [];
    final graphData = graph.map((e) => BarGraphModel.fromJson(e)).toList();

    return FundPerformaceModel(name: json["fund"], graphData: graphData);
  }
}
