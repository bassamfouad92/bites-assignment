import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color kPrimaryColor = Color(0xff6061F0);
const double kCardBorderRadius = 8;
const Color kPink = Color(0xffe10a7d);
const Color kErrorColor = Color(0xFFe63950);
const Color kGreen = Color(0xff79cbbd);
const Color kBlue = Color(0xff194e57);
const Color kBlueDark = Color(0xff1b0b56);
const Color kLightGrey = Color(0xffF4F5FA);
const Color kShadowGrey = Color(0xff86A8E7);
const Color kDarkGrey = Color(0xff133846);
const Color kMarineBlue = Color(0xff02457A);
const Color kLimeGreen = Color(0xff20C514);
const Color kPastalGreen = Color(0xffF1FAE3);
const Color kPastalBlue = Color(0xffE2F7FA);
const Color kSecondaryBlue = Color(0xff018ABE);
const Color kTextColorLight = Color(0xff707070);
const Color kProgressUnSelectColor = Color(0xffc4c4c4);
const Color kSecondaryPink = Color(0xffEB4886);
const Color kSuccessColor = Color(0xff20C514);
const Color kDarkBlue = Color(0xff001B48);
const Color kButtonDisable = Color(0xffBEC3C3);
const Color kSecondaryLightBlue = Color(0xff97CADB);
const Color kSecondaryMediumBlue = Color(0xff91d0e6);
const Color kCircularProgressActive = Color(0xff1a9c11);
const Color kPrimaryWhite = Color(0xffFFFFFF);
const Color kPrimaryBlue = Color(0xff24D8F1);
const Color kPrimaryDarkBlue = Color(0xff02457A);
const Color kSuccessLightGreen = Color(0xffEFF8E1);
const Color kBlackColor = Color(0xFF000000);
const Color kGreyColor = Color(0xFF4D4D4D);
const Color kGreyBackColor = Color(0xFF878787);
const Color kLightOrange = Color(0xFFF4D79F);
const Color kLightOrangeAlpha = Color(0xFFFAF6EA);
const Color kLightRedAlpha = Color(0xFFf7e1e1);
const Color kLightRed = Color(0xFFF56161);
const Color kLightPurpleAlpha = Color(0xffe1a3f3);

const RadialGradient gradientBackground = RadialGradient(
    center: Alignment(3.88378, 8.93035), //Alignment(3.88378, 8.93035)
    focalRadius: 3.88378,
    focal: Alignment(-0.2487, 1.2405), // added focalRadius
    colors: [
      Color.fromRGBO(96, 71, 237, 0.12),
      Color.fromRGBO(0, 209, 255, 0.12),
    ],
    stops: [
      0,
      100
    ]);

const RadialGradient gradientBackgroundLogin = RadialGradient(
    center: Alignment(-0.2487, 1.2405), //Alignment(3.88378, 8.93035)
    focalRadius: 8.88378,
    colors: [
      Color.fromRGBO(96, 71, 237, 0.12),
      Color.fromRGBO(0, 209, 255, 0.04),
    ],
    stops: [
      0,
      100
    ]);

final appTheme = _buildTheme();

ThemeData _buildTheme() {
  return ThemeData(
    fontFamily: 'Cairo',
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
    useMaterial3: true,
  );
}
