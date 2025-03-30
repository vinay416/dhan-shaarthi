import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/nav_entity.dart';

import '../respository/fund_details_repository.dart';

class GetNavDetails {
  const GetNavDetails(this.repo);
  final FundDetailsRepository repo;

  Future<Either<Failure, NavEntity>> call() async {
    return await repo.getNavDetails();
  }
}
