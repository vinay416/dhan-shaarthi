import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BarGraphDataEntity extends Equatable {
  const BarGraphDataEntity({required this.x, required this.barRods});
  final int x;
  final List<BarsData> barRods;

  @override
  List<Object?> get props => [x, barRods];
}

class BarsData extends Equatable {
  const BarsData({required this.toY, required this.bars});
  final double toY;
  final List<BarItem> bars;

  @override
  List<Object?> get props => [toY, bars];
}

class BarItem extends Equatable {
  const BarItem({required this.end, required this.start, required this.color});
  final num start;
  final num end;
  final Color color;
  @override
  List<Object?> get props => [start, end, color];
}
