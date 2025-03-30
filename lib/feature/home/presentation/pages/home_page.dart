import 'package:dhan_saarthi/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/utils/home_string_const.dart';
import '../widgets/home_logo_ham.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(toolbarHeight: 0), body: buildHome(context));
  }

  Padding buildHome(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          HomeLogoHam(),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                HomeStringConst.kWelcomeUser,
                style: semiBoldTextStyle.copyWith(fontSize: 24),
              ),
              buildLogout(context),
            ],
          ),
        ],
      ),
    );
  }

  IconButton buildLogout(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<AuthBloc>().add(SignOutEvent());
      },
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Text(
            HomeStringConst.kLogOut,
            style: semiBoldTextStyle.copyWith(fontSize: 12),
          ),
          Icon(Icons.login, color: kBlueColor),
        ],
      ),
    );
  }
}
