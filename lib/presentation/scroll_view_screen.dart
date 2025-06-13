import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class ScrollViewScreen extends StatefulWidget {
  const ScrollViewScreen({super.key});

  @override
  State<ScrollViewScreen> createState() => _ScrollViewScreenState();
}

class _ScrollViewScreenState extends State<ScrollViewScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showEndMessage = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        if (!_showEndMessage) {
          setState(() {
            _showEndMessage = true;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'You have reached the end of the scroll view',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              duration: Duration(seconds: 1),
              backgroundColor: Colors.redAccent,
            ),
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  final List<String> labels = [
    'Energy Core',
    'Armor System',
    'Flight Unit',
    'Targeting Lasers',
    'Artificial Intelligence',
    'Power Shield',
    'Weapon Module',
    'Emergency Protocol',
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          height: screenHeight * 2,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: List.generate(labels.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                padding: const EdgeInsets.all(70),
                decoration: BoxDecoration(
                  color: Colors.redAccent.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    labels[index],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
