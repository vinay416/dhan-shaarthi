import 'package:equatable/equatable.dart';

import 'bar_graph_data_entity.dart';

class FundPerformaceEntity extends Equatable {
  const FundPerformaceEntity({required this.name, required this.graphData});
  final String name;
  final List<BarGraphDataEntity> graphData;

  @override
  List<Object?> get props => [name, graphData];
}
