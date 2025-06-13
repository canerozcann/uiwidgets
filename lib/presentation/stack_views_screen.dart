import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class StackViewsScreen extends StatelessWidget {
  const StackViewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final spells = [
      'Expelliarmu',
      'Expecto ',
      'Avada Ked',
      'Wingardium  ',
    ];

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;

              return Stack(
                alignment: Alignment.center,
                children: List.generate(spells.length, (index) {
                  final angle = (360 / spells.length) * index;
                  final radians = angle * 3.1416 / 180;
                  final offsetX =
                      (width / 3) * (0.8 * (index % 2 == 0 ? 1 : -1));
                  final offsetY = (height / 3) * (0.5 * (index < 2 ? 1 : -1));

                  return Positioned(
                    left: width / 2 + offsetX - 60,
                    top: height / 2 + offsetY - 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade700,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.shade900,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          )
                        ],
                      ),
                      child: Text(
                        spells[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
