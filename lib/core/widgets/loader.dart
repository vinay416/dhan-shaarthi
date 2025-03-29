import 'package:dhan_saarthi/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.size = 20});
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(color: kWhiteColor),
    );
  }
}
