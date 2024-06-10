import 'package:bites_assignment/common/model/secure_user_session.dart';
import 'package:bites_assignment/common/theme/theme.dart';
import 'package:bites_assignment/home/home_screen.dart';
import 'package:bites_assignment/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isUserLoggedIn = await SecureUserSession().isUserLoggedIn();
  runApp(
    ProviderScope(
      child: MyApp(isUserLoggedIn),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isUserLoggedIn;
  // ignore: use_key_in_widget_constructors
  const MyApp(this.isUserLoggedIn);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bites',
      theme: appTheme,
      home: isUserLoggedIn ? const HomeScreen() : const LoginScreen(),
      builder: EasyLoading.init(),
    );
  }
}
