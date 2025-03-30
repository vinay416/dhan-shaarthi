import 'package:equatable/equatable.dart';

import 'graph_data_enity.dart';

class NavEntity extends Equatable {
  const NavEntity({required this.lineGraphData, required this.name});
  final String name;
  final List<GraphData> lineGraphData;

  @override
  List<Object?> get props => [name, lineGraphData];
}
