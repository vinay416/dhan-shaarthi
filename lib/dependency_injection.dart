import 'package:dhan_saarthi/core/secret_keys.dart';
import 'package:dhan_saarthi/core/toast_helper..dart';
import 'package:dhan_saarthi/feature/auth/data/respository/auth_repository_impl.dart';
import 'package:dhan_saarthi/feature/auth/domain/usecase/send_otp_auth.dart';
import 'package:dhan_saarthi/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/data_source/fund_details_remote_source.dart';
import 'package:dhan_saarthi/feature/fund_detail/data/repository/fund_details_repository_impl.dart';
import 'package:dhan_saarthi/feature/fund_detail/domain/respository/fund_details_repository.dart';
import 'package:dhan_saarthi/feature/fund_detail/presentation/bloc/fund_detail_bloc.dart';
import 'package:dhan_saarthi/feature/fund_detail/presentation/bloc/fund_graph/fund_graph_bloc.dart';
import 'package:dhan_saarthi/feature/intro/data/data_source/intro_local_data_source.dart';
import 'package:dhan_saarthi/feature/intro/data/repository/intro_repository_impl.dart';
import 'package:dhan_saarthi/feature/intro/presentation/bloc/intro_bloc.dart';
import 'package:dhan_saarthi/feature/watchlist/data/data_source/watchlist_local_data_source.dart';
import 'package:dhan_saarthi/feature/watchlist/data/repository/watchlist_repository_impl.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/bloc/manage_watchlist/manage_watchlist_bloc.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/bloc/watchlist_bloc.dart';
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
import 'feature/watchlist/domain/repository/watchlist_repository.dart';
import 'feature/watchlist/domain/usecase/add_watchlist.dart';
import 'feature/watchlist/domain/usecase/add_watchlist_funds.dart';
import 'feature/watchlist/domain/usecase/delete_watchlist.dart';
import 'feature/watchlist/domain/usecase/delete_watchlist_fund.dart';
import 'feature/watchlist/domain/usecase/get_watchlist.dart';
import 'feature/watchlist/domain/usecase/update_watchlist.dart';

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
  di.registerLazySingleton<SharedPreferences>(() => prefs);
  di.registerLazySingleton<IntroLocalDataSource>(
    () => IntroLocalDataSourceImpl(di()),
  );

  di.registerFactory<HomeTabBarBloc>(() => HomeTabBarBloc());
  di.registerFactory<FundDetailBloc>(
    () => FundDetailBloc(getFundDetails: di()),
  );
  di.registerFactory<FundGraphBloc>(() => FundGraphBloc());
  di.registerLazySingleton<GetFundDetails>(() => GetFundDetails(di()));
  di.registerLazySingleton<FundDetailsRepository>(
    () => FundDetailsRepositoryImpl(remoteSource: di()),
  );
  di.registerLazySingleton<FundDetailsRemoteSource>(
    () => FundDetailsRemoteSourceImpl(di()),
  );

  di.registerFactory<WatchlistBloc>(
    () => WatchlistBloc(
      getWatchlist: di(),
      addWatchlistFund: di(),
      deleteWatchlistFund: di(),
      toastHelper: di(),
    ),
  );
  di.registerFactory<ManageWatchlistBloc>(
    () => ManageWatchlistBloc(
      addWatchlist: di(),
      updateWatchlist: di(),
      deleteWatchlist: di(),
      toastHelper: di(),
    ),
  );
  di.registerLazySingleton<GetWatchlist>(() => GetWatchlist(repo: di()));
  di.registerLazySingleton<AddWatchlist>(() => AddWatchlist(repo: di()));
  di.registerLazySingleton<UpdateWatchlist>(() => UpdateWatchlist(repo: di()));
  di.registerLazySingleton<DeleteWatchlist>(() => DeleteWatchlist(repo: di()));
  di.registerLazySingleton<AddWatchlistFund>(
    () => AddWatchlistFund(repo: di()),
  );
  di.registerLazySingleton<DeleteWatchlistFund>(
    () => DeleteWatchlistFund(repo: di()),
  );
  di.registerLazySingleton<WatchlistRepository>(
    () => WatchlistRepositoryImpl(localDataSource: di()),
  );
  di.registerLazySingleton<WatchlistLocalDataSource>(
    () => WatchlistLocalDataSourceImpl(di()),
  );

  di.registerLazySingleton<Dio>(() => Dio());
}
