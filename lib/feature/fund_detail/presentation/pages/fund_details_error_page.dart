import 'package:dhan_saarthi/core/widgets/custom_app_bar.dart';
import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

class FundDetailsErrorPage extends StatelessWidget {
  const FundDetailsErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Icon(Icons.error, color: kRedColor, size: 50),
            Text("Something Went Wrong", style: semiBoldTextStyle.copyWith()),
          ],
        ),
      ),
    );
  }
}
