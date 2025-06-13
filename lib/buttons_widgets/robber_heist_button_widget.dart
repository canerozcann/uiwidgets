import 'package:flutter/material.dart';
import 'dart:math' as math;

class HeistButton extends StatefulWidget {
  final String closedImage;
  final String openImage;
  final double size;

  const HeistButton({
    Key? key,
    required this.closedImage,
    required this.openImage,
    this.size = 150,
  }) : super(key: key);

  @override
  State<HeistButton> createState() => _HeistButtonState();
}

class _HeistButtonState extends State<HeistButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _animation = Tween<double>(begin: -0.1, end: 0.1)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPressed() {
    _controller.forward();

    setState(() {
      _isPressed = !_isPressed;
    });

    Future.delayed(const Duration(seconds: 1), () {
      _controller.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value * math.pi,
          child: GestureDetector(
            onTap: _onPressed,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _isPressed
                  ? Image.asset(
                      widget.openImage,
                      key: const ValueKey('open'),
                      width: widget.size,
                    )
                  : Image.asset(
                      widget.closedImage,
                      key: const ValueKey('closed'),
                      width: widget.size,
                    ),
            ),
          ),
        );
      },
    );
  }
}
