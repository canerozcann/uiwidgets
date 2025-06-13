import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class LinearProgressScreen extends StatefulWidget {
  const LinearProgressScreen({super.key});

  @override
  State<LinearProgressScreen> createState() => _LinearProgressScreenState();
}

class _LinearProgressScreenState extends State<LinearProgressScreen> {
  int _progress = 0;

  void _incrementProgress() {
    setState(() {
      _progress = (_progress + 1) % 11;
    });
  }

  Color _getProgressColor() {
    if (_progress <= 3) {
      return Colors.red;
    } else if (_progress <= 7) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    double percent = _progress / 10;

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Learning Level: $_progress / 10',
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  LinearProgressIndicator(
                    value: percent,
                    minHeight: 30,
                    backgroundColor: Colors.grey[800],
                    valueColor:
                        AlwaysStoppedAnimation<Color>(_getProgressColor()),
                  ),
                  Text(
                    '${(_progress * 10).toInt()}%',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _incrementProgress,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('New Concept Learned!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
