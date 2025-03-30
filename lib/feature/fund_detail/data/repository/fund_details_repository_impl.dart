import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/data_source/fund_details_remote_source.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/fund_invest_entity.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/fund_performace_enity.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/enitiies/nav_entity.dart';
import '../../domain/respository/fund_details_repository.dart';

class FundDetailsRepositoryImpl implements FundDetailsRepository {
  const FundDetailsRepositoryImpl({required this.remoteSource});
  final FundDetailsRemoteSource remoteSource;

  @override
  Future<Either<Failure, FundInvestEntity>> getFundInvestDetails() async {
    try {
      final investFundDetails = await remoteSource.getFundInvestDetails();
      return Right(investFundDetails);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NavEntity>> getNavDetails() async {
    try {
      final navDetails = await remoteSource.getNavDetails();
      return Right(navDetails);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, FundPerformaceEnity>> getPerformanceDetails() async {
    try {
      final performanceDetails = await remoteSource.getFundPerformaceDetails();
      return Right(performanceDetails);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
