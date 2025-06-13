import 'package:flutter/material.dart';

class UserInputFields extends StatelessWidget {
  const UserInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextField(
          hintText: 'Enter First and Last Name',
          textColor: Colors.red,
          fontWeight: FontWeight.bold,
        ),
        SizedBox(height: 16),
        CustomTextField(
          hintText: 'Enter Email',
          textColor: Colors.blue,
          fontStyle: FontStyle.italic,
        ),
        SizedBox(height: 16),
        CustomTextField(
          hintText: 'Enter Phone Number',
          textColor: Colors.green,
          isUnderline: true,
        ),
      ],
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Color textColor;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final bool isUnderline;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textColor,
    this.fontWeight,
    this.fontStyle,
    this.isUnderline = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: textColor,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: isUnderline ? TextDecoration.underline : null,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
