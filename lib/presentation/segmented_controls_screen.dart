import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class SegmentPage extends StatefulWidget {
  const SegmentPage({Key? key}) : super(key: key);

  @override
  State<SegmentPage> createState() => _SegmentPageState();
}

class _SegmentPageState extends State<SegmentPage> {
  int selectedIndex = 0;

  final List<String> segments = [
    "Neon Flutter Team",
    "Neon",
    "Applications",
  ];

  final List<Color> colors = [
    const Color.fromARGB(255, 230, 47, 111),
    const Color.fromARGB(255, 0, 130, 112),
    const Color.fromARGB(255, 166, 127, 0),
  ];

  double getSegmentHeight() {
    switch (selectedIndex) {
      case 0:
        return 200;
      case 1:
        return 150;
      case 2:
        return 100;
      default:
        return 150;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 183, 181, 181),
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ToggleButtons(
            isSelected: List.generate(3, (index) => index == selectedIndex),
            onPressed: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            borderRadius: BorderRadius.circular(10),
            selectedColor: Colors.white,
            fillColor: colors[selectedIndex],
            color: Colors.black87,
            constraints: const BoxConstraints(minHeight: 50, minWidth: 100),
            children: segments
                .map((text) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(text, textAlign: TextAlign.center),
                    ))
                .toList(),
          ),
          const SizedBox(height: 30),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: getSegmentHeight(),
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            decoration: BoxDecoration(
              color: colors[selectedIndex],
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: colors[selectedIndex].withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              segments[selectedIndex],
              style: TextStyle(
                color: Colors.white,
                fontSize: selectedIndex == 0 ? 22 : 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
