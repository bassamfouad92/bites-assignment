import 'package:bites_assignment/common/model/secure_user_session.dart';
import 'package:bites_assignment/home/home_screen.dart';
import 'package:bites_assignment/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late SecureUserSession secureUserSession;

  setUp(() {
    secureUserSession = SecureUserSession();
    secureUserSession.deleteToken();
  });

  testWidgets('LoginScreen integration test with login success flow',
      (WidgetTester tester) async {
    //MyApp with mock isUserLoggedIn = false
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(false),
      ),
    );

    /* Setups key the finder */
    final Finder signInEmailField = find.byKey(const Key('signInEmailField'));
    final Finder signInPasswordField =
        find.byKey(const Key('signInPasswordField'));
    final Finder signInSaveButton = find.byKey(const Key('signInSaveButton'));
    final Finder showHidePasswordButton =
        find.byKey(const Key('showHidePasswordButton'));

    await tester.tap(signInEmailField);
    await tester.enterText(signInEmailField, "string");

    await tester.tap(signInPasswordField);
    await tester.enterText(signInPasswordField, "string");

    await tester.tap(showHidePasswordButton);
    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(
        find.byWidgetPredicate((widget) =>
            widget is Icon && widget.icon == Icons.visibility_outlined),
        findsOneWidget);

    await tester.tap(signInSaveButton);
    await tester.pumpAndSettle(const Duration(seconds: 2));

    expect(find.byWidgetPredicate((widget) => widget is HomeScreen),
        findsOneWidget);
  });
}
