import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/data_source/fund_details_remote_source.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/fund_details_entity.dart';
import '../../domain/respository/fund_details_repository.dart';
import '../models/fund_details_model.dart';

class FundDetailsRepositoryImpl implements FundDetailsRepository {
  const FundDetailsRepositoryImpl({required this.remoteSource});
  final FundDetailsRemoteSource remoteSource;

  @override
  Future<Either<Failure, FundDetailsEntity>> getFundDetails() async {
    try {
      final navDetails = await remoteSource.getNavDetails();
      final investFundDetails = await remoteSource.getFundInvestDetails();
      final performanceDetails = await remoteSource.getFundPerformaceDetails();
      final details = FundDetailsModel(
        fundNav: navDetails,
        fundInvestment: investFundDetails,
        fundPerformance: performanceDetails,
      );
      return Right(details);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
