import 'package:dhan_saarthi/dependency_injection.dart';
import 'package:dhan_saarthi/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:dhan_saarthi/feature/fund_detail/presentation/bloc/fund_detail_bloc.dart';
import 'package:dhan_saarthi/feature/home/presentation/bloc/tab_bar/home_tab_bar_bloc.dart';
import 'package:dhan_saarthi/feature/intro/presentation/bloc/intro_bloc.dart';
import 'package:dhan_saarthi/feature/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:dhan_saarthi/routes/routes.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/auth/presentation/pages/auth_watcher.dart';
import 'feature/fund_detail/presentation/bloc/fund_graph/fund_graph_bloc.dart';
import 'feature/watchlist/presentation/bloc/manage_watchlist/manage_watchlist_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const MainApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di<AuthBloc>()..add(InitialAuth())),
        BlocProvider(create: (_) => di<IntroBloc>()),
        BlocProvider(create: (_) => di<HomeTabBarBloc>()),
        BlocProvider(create: (_) => di<FundDetailBloc>()),
        BlocProvider(create: (_) => di<FundGraphBloc>()),
        BlocProvider(create: (_) => di<WatchlistBloc>()),
        BlocProvider(create: (_) => di<ManageWatchlistBloc>()),
      ],
      child: AuthWatcher(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: AppTheme().call(),
          onGenerateRoute: onGenerateRoute,
        ),
      ),
    );
  }
}
