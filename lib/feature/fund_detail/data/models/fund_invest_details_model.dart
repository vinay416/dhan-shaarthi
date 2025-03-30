import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/fund_invest_entity.dart';
import 'graph_data_model.dart';

class FundInvestDetailsModel extends FundInvestEntity {
  const FundInvestDetailsModel({
    required super.fundLineGraphData,
    required super.investmentLineGraphData,
    required super.name,
  });

  factory FundInvestDetailsModel.fromJson(Map<String, dynamic> json) {
    final String name = json["fund"] ?? "N/A";
    final List navData = json["fund_data"] ?? [];
    final List investData = json["invest_data"] ?? [];
    final fundLineGraphData =
        navData.map((e) => GraphDataModel.fromJson(e)).toList();
    final investmentLineGraphData =
        investData.map((e) => GraphDataModel.fromJson(e)).toList();
    return FundInvestDetailsModel(
      fundLineGraphData: fundLineGraphData,
      investmentLineGraphData: investmentLineGraphData,
      name: name,
    );
  }
}
