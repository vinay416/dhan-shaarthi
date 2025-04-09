import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  ThemeData call() {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: kBlackColor,
      appBarTheme: AppBarTheme(
        backgroundColor: kBlackColor,
        scrolledUnderElevation: 0,
        foregroundColor: kWhiteColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: kBlackColor,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: kBlackColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
    );
  }
}

/// App Colors [Theme]
const Color kBlueColor = Color(0xFF0070DF);
const Color kRedColor = Color(0xFFDE504B);
const Color kOrangeColor = Color(0xFFFDA712);
const Color kGreenDarkColor = Color(0xFF358438);
const Color kGreenColor = Color(0xFF4CAF50);
const Color k262626Color = Color(0xFF262626);
const Color k6D6D6DColor = Color(0xFF6D6D6D);
const Color k5D5D5DColor = Color(0xFF5D5D5D);
const Color kBlackColor = Color(0xFF171616);
const Color k888888Color = Color(0xFf888888);
const Color k3D3D3DColor = Color(0xFF3D3D3D);
const Color kE7E7E7Color = Color(0xFFE7E7E7);
const Color k454545Color = Color(0xFF454545);
const Color kB0B0B0Color = Color(0xFFB0B0B0);
const Color k171616Color = Color(0xFF171616);
const Color kWhiteColor = Colors.white;

/// App Text Family [Theme]
const String fontFamily = "Gilroy";

/// App Text Styles [Theme]
const TextStyle lightTextStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w400,
  color: kWhiteColor,
);
const TextStyle regularTextStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w400,
  color: kWhiteColor,
);
const TextStyle mediumTextStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w500,
  color: kWhiteColor,
);
const TextStyle semiBoldTextStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w600,
  color: kWhiteColor,
);
