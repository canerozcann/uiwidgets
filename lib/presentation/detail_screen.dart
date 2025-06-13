import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/Routes/app_router.gr.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  final List<String> items = const [
    "Container",
    "Buttons",
    "Textfield",
    "Sliders",
    "Switches",
    "Steppers",
    "Page Control",
    "Segmented Controls",
    "Alert Controllers",
    "Circular Progress Indicators",
    "Linear Progress Indicators",
    "Stack Views",
    "Scroll View",
    "Tabbar",
    "Pickers",
    "Data Table",
    "Search Bar",
    "Grid View",
    "List View"
  ];

  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _slideAnimations;
  late final List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(
      items.length,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 300),
      ),
    );

    _slideAnimations = _controllers.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0, 0.2),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeOut),
      );
    }).toList();

    _fadeAnimations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0,
        end: 1,
      ).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeIn),
      );
    }).toList();

    _playAnimations();
  }

  Future<void> _playAnimations() async {
    for (int i = 0; i < _controllers.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        _controllers[i].forward();
      }
    }
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _navigateByItem(String item) {
    switch (item) {
      case "Container":
        context.router.push(const ScrollableContainersRoute());
        break;
      case "Buttons":
        context.router.push(const ButtonsRoute());
        break;
      case "Textfield":
        context.router.push(const TextfieldRoute());
        break;
      case "Sliders":
        context.router.push(const SliderRoute());
        break;
      case "Switches":
        context.router.push(const SwitchesRoute());
        break;
      case "Steppers":
        context.router.push(const SteppersRoute());
        break;
      case "Page Control":
        context.router.push(const AlexanderRoute());
        break;
      case "Segmented Controls":
        context.router.push(const SegmentRoute());
        break;
      case "Alert Controllers":
        context.router.push(const PinokyoAlertRoute());
        break;
      case "Circular Progress Indicators":
        context.router.push(const CircularProgresRoute());
        break;
      case "Linear Progress Indicators":
        context.router.push(const LinearProgressRoute());
        break;
      case "Stack Views":
        context.router.push(const StackViewsRoute());
        break;
      case "Scroll View":
        context.router.push(const ScrollViewRoute());
        break;
      case "Tabbar":
        context.router.push(const TabbarRoute());
        break;
      case "Pickers":
        context.router.push(const PickersRoute());
        break;
      case "Data Table":
        context.router.push(const DataTableRoute());
        break;
      case "Search Bar":
        context.router.push(SearchablePersonRoute());
        break;
      case "Grid View":
        context.router.push(const GridViewRoute());
        break;
      case "List View":
        context.router.push(const ListViewRoute());
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black,
            content: Center(child: Text('$item sayfası tanımlı değil')),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return FadeTransition(
            opacity: _fadeAnimations[index],
            child: SlideTransition(
              position: _slideAnimations[index],
              child: GestureDetector(
                onTap: () => _navigateByItem(items[index]),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: const Color.fromARGB(255, 167, 56, 201),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        items[index],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 21),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
