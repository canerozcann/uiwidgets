import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ValidatedUserInputFields extends StatefulWidget {
  const ValidatedUserInputFields({super.key});

  @override
  State<ValidatedUserInputFields> createState() =>
      _ValidatedUserInputFieldsState();
}

class _ValidatedUserInputFieldsState extends State<ValidatedUserInputFields> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String? emailError;

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: nameController,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => FocusScope.of(context).unfocus(),
          style:
              const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          decoration: const InputDecoration(
            hintText: 'Enter First and Last Name',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            setState(() {
              emailError = isValidEmail(value) ? null : 'Invalid email format';
            });
          },
          style:
              const TextStyle(color: Colors.blue, fontStyle: FontStyle.italic),
          decoration: InputDecoration(
            hintText: 'Enter Email',
            errorText: emailError,
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          maxLength: 10,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          style: const TextStyle(
              color: Colors.green, decoration: TextDecoration.underline),
          decoration: const InputDecoration(
            hintText: 'Enter Phone Number',
            border: OutlineInputBorder(),
            counterText: "",
          ),
        ),
      ],
    );
  }
}
