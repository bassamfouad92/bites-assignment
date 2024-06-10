import 'package:bites_assignment/common/helper/assets_helper.dart';
import 'package:bites_assignment/common/theme/app_styles.dart';
import 'package:bites_assignment/home/data/contact_user.dart';
import 'package:flutter/material.dart';

class ContactListItem extends StatelessWidget {
  final ContactUser contactUser;
  // ignore: use_key_in_widget_constructors
  const ContactListItem(this.contactUser);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        elevation: 0,
        color: Colors.white,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 13.0),
          title: Text(
            contactUser.name,
            style:
                Textify.heading2(context).copyWith(fontWeight: FontWeight.w400),
            textAlign: TextAlign.end, // Align text to the right
          ),
          trailing: Image.asset(
            AssetsHelper.magicIcon, // Replace with your asset path
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
