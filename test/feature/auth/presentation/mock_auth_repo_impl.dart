import 'package:dhan_saarthi/feature/auth/data/respository/auth_repository_impl.dart';
import 'package:dhan_saarthi/feature/auth/domain/usecase/current_user_auth.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([MyAuthRepoImpl])
class MyAuthRepoImpl extends Mock implements AuthRepositoryImpl {}

@GenerateMocks([MyCurrentUserAuth])
class MyCurrentUserAuth extends Mock implements CurrentUserAuth {}
