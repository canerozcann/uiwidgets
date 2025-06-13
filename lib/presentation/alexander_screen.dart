import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class AlexanderScreen extends StatefulWidget {
  const AlexanderScreen({super.key});

  @override
  State<AlexanderScreen> createState() => _AlexanderScreenState();
}

class _AlexanderScreenState extends State<AlexanderScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> titles = [
    "Intelligence of the Kingdom",
    "The Great Commission",
    "Fine Tuning",
    "Visual Feast",
    "Unique Background",
    "Big Presentation",
  ];

  final List<String> subtitles = [
    "Alexander is fascinated by technology.",
    "He was asked to do a Page Check.",
    "Everything had to look perfect.",
    "The color changes as you scroll.",
    "Experimented with patterns and colors.",
    "He presented it to the king and queen.",
  ];

  final List<String> images = [
    "assets/images/prince (1).png",
    "assets/images/prince (2).png",
    "assets/images/prince (3).png",
    "assets/images/frog-prince.png",
    "assets/images/prince (2).png",
    "assets/images/prince (3).png",
  ];

  final List<Color> backgroundColors = [
    Colors.blue.shade100,
    Colors.purple.shade100,
    Colors.orange.shade100,
    Colors.green.shade100,
    Colors.teal.shade100,
    Colors.pink.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColors[_currentPage],
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: titles.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        titles[index],
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        subtitles[index],
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30),
                      Image.asset(
                        images[index],
                        height: 200,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(titles.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: _currentPage == index ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.black : Colors.grey,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
