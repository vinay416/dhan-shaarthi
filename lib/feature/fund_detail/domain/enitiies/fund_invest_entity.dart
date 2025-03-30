import 'package:equatable/equatable.dart';

import 'graph_data_enity.dart';

class FundInvestEntity extends Equatable {
  const FundInvestEntity({
    required this.investmentLineGraphData,
    required this.fundLineGraphData,
    required this.name,
  });
  final String name;
  final List<GraphData> investmentLineGraphData;
  final List<GraphData> fundLineGraphData;

  @override
  List<Object?> get props => [name, investmentLineGraphData, fundLineGraphData];
}
