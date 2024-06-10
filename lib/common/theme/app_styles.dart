import 'dart:io';
import 'package:flutter/material.dart';

/// A class that holds all the icon sizes used throughout
/// the entire app.
@immutable
class IconSizes {
  const IconSizes._privateConstructor();

  static const double sm19 = 19;
  static const double med22 = 22;
  static const double lg27 = 27;
}

/// A class that holds the height and width
/// throughout the entire app by things such as getting height, width, divider etc.
@immutable
class UiUtils {
  const UiUtils._privateConstructor();

  static disableKeyboard(context) =>
      FocusScope.of(context).requestFocus(FocusNode());

  static Divider getDivider({double height = 1}) =>
      Divider(thickness: 1, height: height);

  static Size getScreenSize(context) => MediaQuery.of(context).size;

  static double getScreenWidth(context) => MediaQuery.of(context).size.width;

  static double getScreenHeight(context) => MediaQuery.of(context).size.height;

  static double getValueForPlatform(
      double androidSize, double iosSize, double defaultSize) {
    if (Platform.isAndroid) {
      return androidSize;
    } else if (Platform.isIOS) {
      return iosSize;
    }

    // Provide a default size if the platform is not recognized.
    return defaultSize;
  }
}

/// A class that holds all the gaps and insets used
/// throughout the entire app by things such as padding, sizedbox etc.
@immutable
class Insets {
  const Insets._privateConstructor();

  static const double formHzPadding = 15;

  static const double homeHzPadding = 28;

  static const double sectionTitleVTPadding = 14;

  /// [SizedBox] of height **3**.
  static const gapH3 = SizedBox(height: 3);

  /// [SizedBox] of height **4**.
  static const gapH4 = SizedBox(height: 4);

  /// [SizedBox] of height **8**.
  static const gapH8 = SizedBox(height: 8);

  /// [SizedBox] of width **3**.
  static const gapW3 = SizedBox(width: 3);

  /// [SizedBox] of height **5**.
  static const gapH5 = SizedBox(height: 5);

  /// [SizedBox] of width **5**.
  static const gapW5 = SizedBox(width: 5);

  /// [SizedBox] of height **10**.
  static const gapH10 = SizedBox(height: 10);

  /// [SizedBox] of width **10**
  static const gapW10 = SizedBox(width: 10);

  /// [SizedBox] of width **15**
  static const gapW15 = SizedBox(width: 15);

  /// [SizedBox] of width **20**
  static const gapW20 = SizedBox(width: 20);

  /// [SizedBox] of height **15**
  static const gapH15 = SizedBox(height: 15);

  /// [SizedBox] of height **16**
  static const gapH16 = SizedBox(height: 16);

  /// [SizedBox] of height **20**
  static const gapH20 = SizedBox(height: 20);

  /// [SizedBox] of height **25**
  static const gapH25 = SizedBox(height: 25);

  static const gapH30 = SizedBox(height: 30);

  /// [SizedBox] of height **40**
  static const gapH40 = SizedBox(height: 40);

  /// [SizedBox] of height **60**
  static const gapH60 = SizedBox(height: 60);

  /// [Spacer] for adding infinite gaps, as much as the constraints
  /// allow.
  static const expand = Spacer();

  /// The value for bottom padding of buttons in the app.
  /// It is measured from the bottom of the screen, that is
  /// behind the android system navigation.
  /// Used to prevent overlapping of android navigation with the button.
  static const bottomInsets = SizedBox(height: 38);

  /// The value for a smaller bottom padding of buttons in the app.
  /// It is measured from the bottom of the screen, that is
  /// behind the android system navigation.
  /// Used to prevent overlapping of android navigation with the button.
  static const bottomInsetsLow = SizedBox(height: 20);
}

/// A class that holds all the border radiuses used throughout
/// the entire app by things such as container, card etc.
///
@immutable
class Corners {
  const Corners._();

  /// [BorderRadius] rounded on all corners by **4**
  static const BorderRadius rounded4 = BorderRadius.all(Radius.circular(4));

  static const BorderRadius rounded5 = BorderRadius.all(Radius.circular(5));

  static const BorderRadius rounded10 = BorderRadius.all(Radius.circular(10));

  static const BorderRadius rounded15 = BorderRadius.all(Radius.circular(15));
}

/// A class that holds all the shadows used throughout
/// the entire app by things such as animations, tickers etc.
///
/// This class has no constructor and all variables are `static`.
@immutable
class Shadows {
  const Shadows._();

  static const List<BoxShadow> universal = [
    BoxShadow(
      color: Color.fromRGBO(51, 51, 51, 0.15),
      blurRadius: 10,
    ),
  ];

  static const elevated = <BoxShadow>[
    BoxShadow(
      color: Color.fromARGB(76, 158, 158, 158),
      blurRadius: 3,
      spreadRadius: -0.2,
      offset: Offset(2, 0),
    ),
    BoxShadow(
      color: Color.fromARGB(76, 158, 158, 158),
      blurRadius: 3,
      spreadRadius: -0.2,
      offset: Offset(-2, 0),
    ),
  ];

  static const List<BoxShadow> small = [
    BoxShadow(
      color: Color.fromRGBO(51, 51, 51, .15),
      blurRadius: 3,
      offset: Offset(0, 1),
    ),
  ];
}

/// A class that holds all the text specific styles used throughout
/// the entire app by things such as heading, description, input field, etc
///
/// This class has no constructor and all variables are `static`.
@immutable
class Textify {
  const Textify._();

  static TextStyle heading(context) => TextStyle(
        fontSize: UiUtils.getScreenWidth(context) / 18,
        fontWeight: FontWeight.w900,
        color: Colors.black,
      );

  static TextStyle heading1(context) => TextStyle(
        fontSize: UiUtils.getScreenWidth(context) / 24,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.48,
        color: Colors.black,
      );

  static TextStyle heading2(context) => TextStyle(
        fontSize: UiUtils.getScreenWidth(context) / 26,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  static TextStyle heading3(context) => TextStyle(
        fontSize: UiUtils.getScreenWidth(context) / 32,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  static TextStyle heading4(context) => TextStyle(
        fontSize: UiUtils.getScreenWidth(context) / 28,
      );

  static TextStyle paragraph1(context) => TextStyle(
        fontSize: UiUtils.getScreenWidth(context) / 28,
        fontWeight: FontWeight.w500,
        decoration: TextDecoration.none,
        letterSpacing: 0.28,
      );

  static TextStyle paragraph2(context) => TextStyle(
      fontSize: UiUtils.getScreenWidth(context) / 32,
      color: Colors.grey,
      fontWeight: FontWeight.w400);

  static TextStyle paragraph3(context) =>
      const TextStyle(fontSize: 10, color: Colors.grey);

  static TextStyle label(context) => TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: UiUtils.getScreenWidth(context) / 28,
      );

  static TextStyle hint(context) => TextStyle(
        fontSize: UiUtils.getScreenWidth(context) / 28,
        fontWeight: FontWeight.w500,
      );

  static TextStyle title1(context) => TextStyle(
        fontSize: UiUtils.getScreenWidth(context) / 24,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );

  static TextStyle title2(context) => TextStyle(
        fontSize: UiUtils.getScreenWidth(context) / 28,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );

  static TextStyle title3(context) => TextStyle(
        fontSize: UiUtils.getScreenWidth(context) / 28,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );

  static TextStyle error(context) => TextStyle(
      fontSize: UiUtils.getScreenWidth(context) / 32, color: Colors.red);

  ///buttons
  static TextStyle buttonNormal(context) => TextStyle(
        fontSize: UiUtils.getScreenWidth(context) / 24,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );
}
