import 'package:flutter/material.dart';

import '../../../../core/string_const/icon_string.dart';

class HomeLogoHam extends StatelessWidget {
  const HomeLogoHam({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(kDLogoIcon, height: 27, width: 20.22),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(kDrawerIcon, height: 24, width: 24),
          ),
        ),
      ],
    );
  }
}
