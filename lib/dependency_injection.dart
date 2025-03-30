import 'package:dhan_saarthi/core/secret_keys.dart';
import 'package:dhan_saarthi/core/toast_helper..dart';
import 'package:dhan_saarthi/feature/auth/data/respository/auth_repository_impl.dart';
import 'package:dhan_saarthi/feature/auth/domain/usecase/send_otp_auth.dart';
import 'package:dhan_saarthi/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/data_source/fund_details_remote_source.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/repository/fund_details_repository_impl.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/respository/fund_details_repository.dart';
import 'package:dhan_saarthi/feature/fund_detail/presentation/bloc/fund_detail_bloc.dart';
import 'package:dhan_saarthi/feature/intro/data/data_source/intro_local_data_source.dart';
import 'package:dhan_saarthi/feature/intro/data/repository/intro_repository_impl.dart';
import 'package:dhan_saarthi/feature/intro/presentation/bloc/intro_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'feature/auth/data/data_sources/auth_remote_source.dart';
import 'feature/auth/domain/repository/auth_repository.dart';
import 'feature/auth/domain/usecase/current_user_auth.dart';
import 'feature/auth/domain/usecase/sign_out_auth.dart';
import 'feature/auth/domain/usecase/verify_otp_auth.dart';
import 'feature/fund_detail/domain/usecase/get_fund_details.dart';
import 'feature/home/presentation/bloc/tab_bar/home_tab_bar_bloc.dart';
import 'feature/intro/domain/repository/intro_repository.dart';
import 'feature/intro/domain/usecase/is_completed_intro.dart';
import 'feature/intro/domain/usecase/set_completed_intro.dart';

final di = GetIt.instance;

Future<void> injectDependencies() async {
  await Supabase.initialize(
    url: SecretKeys.SUPABASE_URL,
    anonKey: SecretKeys.SUPABASE_KEY,
  );
  di.registerLazySingleton<ToastHelper>(() => ToastHelper());
  di.registerFactory<AuthBloc>(
    () => AuthBloc(
      sendOtpAuth: di(),
      verifyOtpAuth: di(),
      signOutAuth: di(),
      currentUserAuth: di(),
      toastHelper: di(),
    ),
  );
  di.registerLazySingleton<SendOtpAuth>(() => SendOtpAuth(auth: di()));
  di.registerLazySingleton<VerifyOtpAuth>(() => VerifyOtpAuth(auth: di()));
  di.registerLazySingleton<CurrentUserAuth>(() => CurrentUserAuth(auth: di()));
  di.registerLazySingleton<SignOutAuth>(() => SignOutAuth(auth: di()));
  di.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(di()));
  di.registerLazySingleton<AuthRemoteSource>(() => AuthRemoteSourceImpl(di()));
  di.registerLazySingleton<GoTrueClient>(() => Supabase.instance.client.auth);

  di.registerFactory<IntroBloc>(
    () => IntroBloc(isCompletedIntro: di(), setCompletedIntro: di()),
  );
  di.registerLazySingleton<IsCompletedIntro>(
    () => IsCompletedIntro(repository: di()),
  );
  di.registerLazySingleton<SetCompletedIntro>(() => SetCompletedIntro(di()));
  di.registerLazySingleton<IntroRepository>(() => IntroRepositoryImpl(di()));
  final prefs = await SharedPreferences.getInstance();
  di.registerLazySingleton<IntroLocalDataSource>(
    () => IntroLocalDataSourceImpl(prefs),
  );

  di.registerFactory<HomeTabBarBloc>(() => HomeTabBarBloc());
  di.registerFactory<FundDetailBloc>(
    () => FundDetailBloc(getFundDetails: di()),
  );
  di.registerLazySingleton<GetFundDetails>(() => GetFundDetails(di()));
  di.registerLazySingleton<FundDetailsRepository>(
    () => FundDetailsRepositoryImpl(remoteSource: di()),
  );
  di.registerLazySingleton<FundDetailsRemoteSource>(
    () => FundDetailsRemoteSourceImpl(di()),
  );
  di.registerLazySingleton<Dio>(() => Dio());
}
