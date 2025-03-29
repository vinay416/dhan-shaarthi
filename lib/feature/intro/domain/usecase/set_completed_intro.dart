import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/intro/domain/repository/intro_repository.dart';

class SetCompletedIntro {
  const SetCompletedIntro(this.repository);
  final IntroRepository repository;

  Future<Either<Failure,Unit>> call() async{
    return await repository.setIntroCompleted();
  }
}