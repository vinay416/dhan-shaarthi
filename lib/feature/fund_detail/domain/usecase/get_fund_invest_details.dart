import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/respository/fund_details_repository.dart';

import '../enitiies/fund_invest_entity.dart';

class GetFundInvestDetails {
  const GetFundInvestDetails(this.repo);
  final FundDetailsRepository repo;

  Future<Either<Failure, FundInvestEntity>> call() async {
    return await repo.getFundInvestDetails();
  }
}
