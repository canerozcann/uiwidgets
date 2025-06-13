import 'package:flutter/material.dart';

class FocusedColorButtonWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget icon;

  const FocusedColorButtonWidget({Key? key, required this.icon, this.onPressed})
      : super(key: key);

  @override
  _FocusedColorButtonWidgetState createState() =>
      _FocusedColorButtonWidgetState();
}

class _FocusedColorButtonWidgetState extends State<FocusedColorButtonWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed?.call();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: _isPressed ? Colors.yellow : Colors.purple[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          child: widget.icon,
        ),
      ),
    );
  }
}
