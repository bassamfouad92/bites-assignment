import 'package:bites_assignment/common/helper/assets_helper.dart';
import 'package:bites_assignment/common/theme/app_styles.dart';
import 'package:bites_assignment/common/theme/theme.dart';
import 'package:bites_assignment/common/widgets/custom_nav_bar.dart';
import 'package:bites_assignment/home/di/home_providers.dart';
import 'package:bites_assignment/home/ui/contact_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  // ignore: use_key_in_widget_constructors
  const HomeScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        key: const Key('homeScreen'),
        width: UiUtils.getScreenWidth(context),
        height: UiUtils.getScreenHeight(context),
        decoration: const BoxDecoration(gradient: gradientBackground),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 94),
                Image.asset(
                  AssetsHelper.chatLogo, // Adjust the path to your logo image
                  height: 135.0,
                ),
                Insets.gapH30,
                Text(
                  '..اسألني عن محاضرتك',
                  style:
                      Textify.heading(context).copyWith(color: kPrimaryColor),
                ),
                Insets.gapH30,
                _buildContactListView(ref),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: UiUtils.getScreenWidth(context),
                child: const CustomBottomNavBar(
                    calenderKey: Key('calendarIcon'),
                    clockKey: Key('clockIcon'),
                    notificationKey: Key('bellIcon'),
                    profileKey: Key('profileIcon')),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactListView(WidgetRef ref) {
    final homeState = ref.watch(homeViewModelProvider);

    return Container(
      height: 500,
      padding: const EdgeInsets.all(24.0),
      child: homeState.contacts.when(
        data: (contacts) => ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: contacts.length,
          itemBuilder: (BuildContext context, int index) {
            return ContactListItem(contacts[index]);
          },
        ),
        loading: () => const Center(
            child: CircularProgressIndicator(key: Key('showLoader'))),
        error: (error, stack) => const Center(child: Text('No data to show')),
      ),
    );
  }
}
