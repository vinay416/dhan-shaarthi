import 'package:dhan_saarthi/feature/auth/presentation/pages/authenticated_page.dart';
import 'package:dhan_saarthi/feature/auth/presentation/pages/verify_auth_page.dart';
import 'package:dhan_saarthi/feature/watchlist/domain/enities/watchlist_entity.dart';
import 'package:flutter/material.dart';

import '../feature/auth/domain/entities/phone_number.dart';
import '../feature/auth/presentation/pages/unauthenticated_page.dart';
import '../feature/intro/presentation/pages/intro_page.dart';
import '../feature/fund_detail/presentation/pages/fund_detail_page.dart';
import '../feature/watchlist/presentation/pages/fund/funds_list_page.dart';

class Routes {
  static const String initial = "/";
  static const String unAuthenticated = "/unAuthenticated";
  static const String authenticated = "/authenticated";
  static const String verifyOTP = "/verifyOTP";
  static const String fundDetail = "/fundDetail";
  static const String fundsList = "/fundsList";
}

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  final route = settings.name;
  switch (route) {
    case Routes.initial:
      return MaterialPageRoute(builder: (_) => IntroPage());
    case Routes.unAuthenticated:
      return MaterialPageRoute(
        builder:
            (_) =>
                UnauthenticatedPage(phone: settings.arguments as PhoneNumber),
      );
    case Routes.verifyOTP:
      return MaterialPageRoute(
        builder:
            (_) => VerifyAuthPage(args: settings.arguments as VerifyAuthArgs),
      );
    case Routes.authenticated:
      return MaterialPageRoute(builder: (_) => AuthenticatedPage());
    case Routes.fundDetail:
      return MaterialPageRoute(builder: (_) => FundDetailPage());
    case Routes.fundsList:
      return MaterialPageRoute(
        builder:
            (_) =>
                FundsListPage(watchlist: settings.arguments as WatchlistEntity),
      );
    default:
      return MaterialPageRoute(
        builder:
            (_) =>
                UnauthenticatedPage(phone: settings.arguments as PhoneNumber),
      );
  }
}
