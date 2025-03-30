import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/fund_performace_enity.dart';

import '../respository/fund_details_repository.dart';

class GetPerformanceDetails {
  const GetPerformanceDetails(this.repo);
  final FundDetailsRepository repo;

  Future<Either<Failure, FundPerformaceEnity>> call() async {
    return await repo.getPerformanceDetails();
  }
}
