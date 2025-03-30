import '../../domain/enitiies/graph_data_enity.dart';

class GraphDataModel extends GraphData {
  const GraphDataModel({required super.timestamp, required super.value});

  factory GraphDataModel.fromJson(List data) {
    return GraphDataModel(timestamp: data[0] as int, value: data[1] as double);
  }
}
