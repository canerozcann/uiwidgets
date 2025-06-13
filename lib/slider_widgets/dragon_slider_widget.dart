import 'package:flutter/material.dart';

class DragonSlider extends StatefulWidget {
  const DragonSlider({super.key});

  @override
  State<DragonSlider> createState() => _DragonSliderState();
}

class _DragonSliderState extends State<DragonSlider> {
  double _currentValue = 0;
  bool _hasShownDialog = false; // Dialogun sadece bir kez gösterilmesi için

  void _showPowerMaxDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Red Alert!",
          style: TextStyle(color: Colors.black),
        ),
        content: const Text("The dragon has reached its final power!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Close",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
        ],
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color blendedColor =
        Color.lerp(Colors.green, Colors.red, _currentValue / 150)!;

    return Column(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(blendedColor, BlendMode.srcIn),
          child: Image.asset(
            "assets/images/dragonGreen.png",
            width: 200,
          ),
        ),
        const SizedBox(height: 12),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: blendedColor,
            inactiveTrackColor: Colors.grey.withOpacity(0.3),
            trackHeight: 8.0,
            thumbColor: Colors.blue,
            overlayColor: Colors.blue.withOpacity(0.2),
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
          ),
          child: Slider(
            min: 0,
            max: 100,
            divisions: 100,
            value: _currentValue,
            onChanged: (value) {
              setState(() {
                _currentValue = value;

                if (_currentValue == 100 && !_hasShownDialog) {
                  _hasShownDialog = true;
                  _showPowerMaxDialog();
                } else if (_currentValue < 100) {
                  _hasShownDialog = false;
                }
              });
            },
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "(Swipe to increase the dragon's power)",
          style: TextStyle(color: Colors.blue, fontSize: 15),
        ),
        const SizedBox(height: 8),
        Text(
          "Current Power: ${_currentValue.toInt()}",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }
}
