// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:dhan_saarthi/core/failure.dart';

import '../../domain/repository/intro_repository.dart';
import '../data_source/intro_local_data_source.dart';

class IntroRepositoryImpl implements IntroRepository {
  final IntroLocalDataSource introLocalDataSource;
  const IntroRepositoryImpl(this.introLocalDataSource);

  @override
  bool get isCompleted => introLocalDataSource.isIntroCompleted;

  @override
  Future<Either<Failure, Unit>> setIntroCompleted() async {
    try {
      await introLocalDataSource.setIntroCompleted();
      return Right(unit);
    } catch (e) {
      return Left(CacheFailure());
    }
  }
}
