import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/fund_graph/fund_graph_bloc.dart';

class NavButton extends StatelessWidget {
  const NavButton({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FundGraphBloc, FundGraphState>(
      builder: (context, state) {
        final isEnbaled = state is NavGraph;
        return SizedBox(
          width: 47,
          height: 28,
          child: OutlinedButton(
            onPressed: onTap,
            style: ButtonStyle(
              side: WidgetStatePropertyAll(
                BorderSide(
                  color: isEnbaled ? kBlueColor : k6D6D6DColor,
                  width: 0.5,
                ),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.91),
                ),
              ),
              padding: WidgetStatePropertyAll(EdgeInsets.zero),
            ),
            child: Text(
              "NAV",
              style: semiBoldTextStyle.copyWith(
                fontSize: 10,
                color: isEnbaled ? kBlueColor : k6D6D6DColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
