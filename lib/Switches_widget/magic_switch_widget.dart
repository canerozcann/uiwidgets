import 'package:flutter/material.dart';

class MagicSwitchWidget extends StatefulWidget {
  @override
  _MagicSwitchWidgetState createState() => _MagicSwitchWidgetState();
}

class _MagicSwitchWidgetState extends State<MagicSwitchWidget> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isOn ? Colors.greenAccent : Colors.red[900]!;
    Color switchColor = isOn ? Colors.red : Colors.green;
    Color thumbColor = Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text("Büyülü Anahtar"),
        backgroundColor: switchColor,
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: backgroundColor,
        child: Center(
          child: Switch(
            value: isOn,
            onChanged: (value) {
              setState(() {
                isOn = value;
              });
            },
            activeColor: switchColor,
            inactiveThumbColor: thumbColor,
            activeTrackColor: switchColor.withOpacity(0.6),
            inactiveTrackColor: switchColor.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
