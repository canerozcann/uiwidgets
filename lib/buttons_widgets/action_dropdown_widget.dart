import 'package:flutter/material.dart';

class ActionDropdownWidget extends StatefulWidget {
  const ActionDropdownWidget({super.key});

  @override
  State<ActionDropdownWidget> createState() => _ActionDropdownWidgetState();
}

class _ActionDropdownWidgetState extends State<ActionDropdownWidget> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 77),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButton<String>(
            dropdownColor: Colors.black,
            value: selectedValue,
            hint: const Text(
              'Select an option',
              style: TextStyle(color: Colors.white),
            ),
            iconEnabledColor: Colors.purpleAccent,
            items: <String>[
              'Call for backup',
              'Warning to the townspeople',
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
          ),
          const SizedBox(height: 20),
          if (selectedValue == 'Warning to the townspeople')
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text(
                  "Warning",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          else if (selectedValue == 'Call for backup')
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text(
                  "Call",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
            )
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}
