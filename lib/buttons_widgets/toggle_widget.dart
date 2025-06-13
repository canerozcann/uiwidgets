import 'package:flutter/material.dart';

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({super.key});

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  bool isSecondButtonEnabled = false;

  void toggleSecondButton() {
    setState(() {
      isSecondButtonEnabled = !isSecondButtonEnabled;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: toggleSecondButton,
          child: const Text(
            'Enable or Disable',
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: isSecondButtonEnabled
              ? () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pressed to second button')),
                  );
                }
              : null,
          child: const Text(
            'Second Button',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
