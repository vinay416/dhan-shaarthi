import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';

abstract class IntroRepository {
  bool get isCompleted;
  Future<Either<Failure,Unit>> setIntroCompleted();
}