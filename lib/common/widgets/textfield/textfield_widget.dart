import 'package:bites_assignment/common/theme/theme.dart';
import 'package:flutter/material.dart';

class BitesTextField extends StatelessWidget {
  final Key myKey;
  final String hintText;
  final bool showPassword;
  final Color borderColor;
  final double borderWidth;
  final Color fillColor;
  final double borderRadius;
  final Widget? rightIcon;
  final TextEditingController controller;
  final Function(String text) onTextChanged;

  BitesTextField({
    required this.myKey,
    required this.controller,
    required this.onTextChanged,
    this.hintText = '',
    this.showPassword = false,
    this.borderColor = kPrimaryColor,
    this.borderWidth = 1.0,
    this.fillColor = Colors.white,
    this.borderRadius = 12.0,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: myKey,
      controller: controller,
      obscureText: showPassword,
      onChanged: (value) => onTextChanged(value),
      decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          filled: true,
          fillColor: fillColor,
          prefixIcon: rightIcon,
          prefixIconColor: kPrimaryColor),
    );
  }
}
