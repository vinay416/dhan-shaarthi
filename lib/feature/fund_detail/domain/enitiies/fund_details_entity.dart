import 'package:equatable/equatable.dart';

import 'fund_invest_entity.dart';
import 'fund_performace_enity.dart';
import 'nav_entity.dart';

class FundDetailsEntity extends Equatable {
  const FundDetailsEntity({
    required this.fundNav,
    required this.fundInvestment,
    required this.fundPerformance,
  });
  final FundInvestEntity fundInvestment;
  final NavEntity fundNav;
  final FundPerformaceEntity fundPerformance;

  @override
  List<Object?> get props => [fundNav, fundInvestment, fundPerformance];
}
