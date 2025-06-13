import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class SwitchesScreen extends StatefulWidget {
  @override
  _SwitchesScreenState createState() => _SwitchesScreenState();
}

class _SwitchesScreenState extends State<SwitchesScreen> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isSwitchOn ? Colors.greenAccent : Colors.red[900]!;

    Color switchTrackColor = isSwitchOn ? Colors.red : Colors.green;

    Color thumbColor = Colors.black;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        color: backgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isSwitchOn
                    ? "Giants active: Brilliant Green"
                    : "Dwarves active Dark Red",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),
              Switch(
                value: isSwitchOn,
                onChanged: (value) {
                  setState(() {
                    isSwitchOn = value;
                  });
                },
                activeColor: thumbColor,
                activeTrackColor: switchTrackColor,
                inactiveThumbColor: thumbColor,
                inactiveTrackColor: switchTrackColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
