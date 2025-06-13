import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class CircularProgresScreen extends StatefulWidget {
  const CircularProgresScreen({super.key});

  @override
  State<CircularProgresScreen> createState() => _CircularProgresScreenState();
}

class _CircularProgresScreenState extends State<CircularProgresScreen> {
  bool showIndicator = false;
  int counter = 0;
  Timer? timer;

  final List<Color> indicatorColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.brown,
    Colors.black,
  ];

  void startCounter() {
    setState(() {
      showIndicator = true;
      counter = 0;
    });

    timer?.cancel();
    timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      if (counter < 100) {
        setState(() {
          counter++;
        });
      } else {
        t.cancel();
        setState(() {
          showIndicator = false;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color currentColor =
        indicatorColors[(counter ~/ 10) % indicatorColors.length];

    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showIndicator)
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentColor,
                  ),
                ),
              const SizedBox(height: 20),
              if (showIndicator)
                Text(
                  '$counter',
                  style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: startCounter,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: const Text(
                  "Show and Launch",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
