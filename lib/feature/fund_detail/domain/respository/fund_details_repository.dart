import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';

import '../enitiies/fund_details_entity.dart';

abstract class FundDetailsRepository {
  Future<Either<Failure, FundDetailsEntity>> getFundDetails();
}
