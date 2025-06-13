import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SteppersScreen extends StatefulWidget {
  const SteppersScreen({Key? key}) : super(key: key);

  @override
  State<SteppersScreen> createState() => _SteppersScreenState();
}

class _SteppersScreenState extends State<SteppersScreen> {
  int _currentStep = 0;
  int _progress = 0;

  final List<String> babyImages = [
    'assets/images/baby.png',
    'assets/images/baby-girl.png',
  ];

  String getRandomBabyImage() {
    final rand = Random();
    return babyImages[rand.nextInt(babyImages.length)];
  }

  void _continue() {
    if (_currentStep < 9) {
      setState(() {
        _currentStep += 1;
        _progress += 5;
        if (_progress > 50) _progress = 50;
      });
    }
  }

  void _finish() {
    setState(() {
      _progress = 50;
    });
    _showCompletionDialog();
  }

  void _cancel() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
        _progress -= 5;
        if (_progress < 0) _progress = 0;
      });
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Congratulations"),
        content: const Text("Outfit is completed!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("Kapat"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double progressPercent = _progress / 50;

    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 167, 56, 201),
        ),
        title: Column(
          children: [
            Image.asset(
              'assets/images/neon.jpeg',
              height: 80,
              width: 80,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 4),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stepper(
              type: StepperType.vertical,
              currentStep: _currentStep,
              onStepContinue: _currentStep == 9 ? _finish : _continue,
              onStepCancel: _currentStep == 9 ? null : _cancel,
              onStepTapped: (index) {
                if (index > 9) return;
                setState(() {
                  _currentStep = index;
                  _progress = 5 * (index + 1);
                  if (_progress > 50) _progress = 50;
                });
              },
              controlsBuilder: (context, details) {
                if (_currentStep == 9) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: const Text('Finish!'),
                    ),
                  );
                }
                return Row(
                  children: [
                    ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: const Text('Continue'),
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Cancel'),
                    ),
                  ],
                );
              },
              steps: List.generate(10, (index) {
                return Step(
                  title: Row(
                    children: [
                      Image.asset(
                        getRandomBabyImage(),
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 8),
                      Text("Step ${index + 1}"),
                    ],
                  ),
                  content: const Text(" "),
                  isActive: _currentStep >= index,
                  state: _currentStep > index
                      ? StepState.complete
                      : StepState.indexed,
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: LinearProgressIndicator(
              value: progressPercent,
              minHeight: 8,
              backgroundColor: Colors.grey[300],
              color: Colors.pinkAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(
              "Progress: $_progress / 50",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.pinkAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
