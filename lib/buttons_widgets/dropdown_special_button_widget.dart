import 'package:flutter/material.dart';

class DailySpecialDropdown extends StatefulWidget {
  const DailySpecialDropdown({super.key});

  @override
  State<DailySpecialDropdown> createState() => _DailySpecialDropdownState();
}

class _DailySpecialDropdownState extends State<DailySpecialDropdown> {
  String? selectedSpecial;

  final List<String> specials = [
    'Special 1',
    'Special 2',
    'Special 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue, width: 2),
          image: const DecorationImage(
            image: AssetImage('assets/images/localBar.png'),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(2, 2),
              blurRadius: 6,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            dropdownColor: Colors.red.shade400,
            hint: const Text(
              'Daily Specials',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black45,
                    offset: Offset(1, 1),
                    blurRadius: 2,
                  )
                ],
              ),
            ),
            value: selectedSpecial,
            iconEnabledColor: Colors.white,
            items: specials.map((special) {
              return DropdownMenuItem<String>(
                value: special,
                child: Text(
                  special,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedSpecial = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
