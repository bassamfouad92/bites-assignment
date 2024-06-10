import 'package:bites_assignment/common/helper/assets_helper.dart';
import 'package:bites_assignment/common/model/secure_user_session.dart';
import 'package:bites_assignment/common/theme/theme.dart';
import 'package:bites_assignment/common/widgets/custom_nav_bar.dart';
import 'package:bites_assignment/home/ui/contact_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:bites_assignment/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('HomeScreen Integration Test', () {
    late SecureUserSession secureUserSession;

    setUp(() {
      secureUserSession = SecureUserSession();
      secureUserSession.saveToken(
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.Ykp2UjRXakVsTTA4VzA0YTRxS054Q2hzUzB2eDJCMmk\n");
    });

    tearDown(() {
      secureUserSession.deleteToken();
    });

    testWidgets('should display the HomeScreen and interact with it',
        (WidgetTester tester) async {
      // Provide the MyApp widget with mock isUserLoggedIn = true
      await tester.pumpWidget(
        const ProviderScope(
          child: MyApp(true),
        ),
      );

      // Allow the widget tree to rebuild
      await tester.pumpAndSettle();
      // Verify the presence of specific UI elements
      expect(find.text('..اسألني عن محاضرتك'), findsOneWidget);

      expect(
        find.byWidgetPredicate(findImageAsset(AssetsHelper.chatLogo)),
        findsOneWidget,
      );
      expect(find.byType(CustomBottomNavBar), findsOneWidget);

      await tester.pumpAndSettle(const Duration(seconds: 1));

      // Verify that the contact list is displayed
      final Finder contactListItemFinder = find.byType(ContactListItem);
      expect(contactListItemFinder, findsWidgets);

      // Interact with the bottom navigation bar
      final Finder bottomNavBarFinder = find.byType(CustomBottomNavBar);
      await tester.tap(bottomNavBarFinder);
      await tester.pumpAndSettle();
    });

    testWidgets('HomeScreen integration test with CustomBottomNavBar',
        (WidgetTester tester) async {
      // Provide the MyApp widget with mock isUserLoggedIn = true
      await tester.pumpWidget(
        const ProviderScope(
          child: MyApp(true),
        ),
      );

      // Wait for the widgets to be rendered
      await tester.pumpAndSettle();

      // Check for the home screen
      expect(find.byKey(const Key('homeScreen')), findsOneWidget);

      // Check for the Image.asset widget with the specific path
      expect(
        find.byWidgetPredicate(findImageAsset(AssetsHelper.chatLogo)),
        findsOneWidget,
      );

      // Check for the CustomBottomNavBar
      expect(find.byType(CustomBottomNavBar), findsOneWidget);

      // Verify that the FAB button is present
      expect(find.byType(FloatingActionButton), findsOneWidget);

      // Define the list of icon keys
      const List<String> iconKeys = [
        'calendarIcon',
        'clockIcon',
        'bellIcon',
        'profileIcon',
      ];

      // Tap on each icon and check the state
      for (final key in iconKeys) {
        await tester.tap(find.byKey(Key(key)));
        await tester.pumpAndSettle();
        expect(
          (tester.firstWidget(find.byKey(Key(key))) as IconButton).icon,
          isA<ImageIcon>().having((icon) => icon.color, 'color', kPrimaryColor),
        );
      }
    });
  });
}

WidgetPredicate findImageAsset(String assetPath) {
  return (widget) =>
      widget is Image &&
      widget.image is AssetImage &&
      (widget.image as AssetImage).assetName == assetPath;
}
