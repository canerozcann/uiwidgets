import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/custom_app_bar.dart';
import 'package:uiwidgets/slider_widgets/dragon_slider_widget.dart';

@RoutePage()
class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [DragonSlider()]),
      backgroundColor: Colors.black,
    );
  }
}
