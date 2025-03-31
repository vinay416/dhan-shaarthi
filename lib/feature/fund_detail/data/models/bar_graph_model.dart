import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/bar_graph_data_entity.dart';
import 'package:flutter/widgets.dart';

class BarGraphModel extends BarGraphDataEntity {
  const BarGraphModel({required super.x, required super.barRods});

  factory BarGraphModel.fromJson(Map<String, dynamic> json) {
    final List bars = json["barRods"] ?? [];
    final barRods = bars.map((e) => BarDataModel.fromJson(e)).toList();
    return BarGraphModel(x: json["x"] as int, barRods: barRods);
  }
}

class BarDataModel extends BarsData {
  const BarDataModel({required super.toY, required super.bars});

  factory BarDataModel.fromJson(Map<String, dynamic> json) {
    final List rods = json["rodStackItems"] ?? [];
    final List<BarItem> bars =
        rods.map((e) => BarItemModel.fromJson(e)).toList();
    return BarDataModel(toY: (json["toY"] as num).toDouble(), bars: bars);
  }
}

class BarItemModel extends BarItem {
  const BarItemModel({
    required super.end,
    required super.start,
    required super.color,
  });

  factory BarItemModel.fromJson(Map<String, dynamic> json) {
    final color = Color(int.parse(json["color"]));
    return BarItemModel(
      end: json["end"] as num,
      start: json["start"] as num,
      color: color,
    );
  }
}
