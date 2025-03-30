import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/fund_invest_entity.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/nav_entity.dart';

import '../enitiies/fund_performace_enity.dart';

abstract class FundDetailsRepository {
  Future<Either<Failure, NavEntity>> getNavDetails();
  Future<Either<Failure, FundInvestEntity>> getFundInvestDetails();
  Future<Either<Failure, FundPerformaceEnity>> getPerformanceDetails();
}
