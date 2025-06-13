import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class TabbarScreen extends StatefulWidget {
  const TabbarScreen({super.key});

  @override
  State<TabbarScreen> createState() => _TabbarScreenState();
}

class _TabbarScreenState extends State<TabbarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<IconData> icons = [
    Icons.flash_on,
    Icons.shield,
    Icons.explore,
    Icons.settings,
  ];

  final List<String> titles = [
    'Energy',
    'Protect',
    'Radar',
    'Control',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.15),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.green,
              tabs: List.generate(4, (index) {
                final isSelected = _tabController.index == index;
                return Tab(
                  icon: Icon(
                    icons[index],
                    color: isSelected ? Colors.yellow : Colors.blue,
                  ),
                  child: Text(
                    titles[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                HulkTabContent(
                  icon: Icons.flash_on,
                  title: 'Controlling energy systems...',
                ),
                HulkTabContent(
                  icon: Icons.shield,
                  title: 'Protection shield active!',
                ),
                HulkTabContent(
                  icon: Icons.explore,
                  title: 'Radar scans enemies...',
                ),
                HulkTabContent(
                  icon: Icons.settings,
                  title: 'The control panel is ready.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HulkTabContent extends StatelessWidget {
  final IconData icon;
  final String title;

  const HulkTabContent({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: Colors.green[700]),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
