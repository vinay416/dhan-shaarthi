// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dhan_saarthi/core/failure.dart';
import 'package:dhan_saarthi/feature/auth/domain/repository/auth_repository.dart';

class SignOutAuth {
  final AuthRepository auth;
  const SignOutAuth({required this.auth});

  Future<Either<Failure, Unit>> call() async {
    return await auth.signOut();
  }
}
