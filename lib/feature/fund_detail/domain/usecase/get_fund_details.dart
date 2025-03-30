import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';

import '../enitiies/fund_details_entity.dart';
import '../respository/fund_details_repository.dart';

class GetFundDetails {
  const GetFundDetails(this.repo);
  final FundDetailsRepository repo;

  Future<Either<Failure, FundDetailsEntity>> call() async {
    return await repo.getFundDetails();
  }
}
