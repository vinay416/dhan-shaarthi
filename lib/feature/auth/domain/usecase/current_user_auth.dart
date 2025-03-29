// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dhan_saarthi/feature/auth/domain/repository/auth_repository.dart';

class CurrentUserAuth {
  final AuthRepository auth;
  const CurrentUserAuth({required this.auth});

  bool get user {
    return auth.currentuser().isRight();
  }
}
