import 'package:equatable/equatable.dart';

class GraphData extends Equatable {
  const GraphData({required this.timestamp, required this.value});
  final int timestamp;
  final double value;

  @override
  List<Object?> get props => [timestamp, value];
}
