import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // URL launcher eklendi
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class GridViewScreen extends StatefulWidget {
  const GridViewScreen({Key? key}) : super(key: key);

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  final List<String> moviePosters = [
    'assets/images/Ekran Resmi 2025-05-26 17.12.16.png',
    'assets/images/Ekran Resmi 2025-05-26 17.12.23.png',
    'assets/images/Ekran Resmi 2025-05-26 17.12.33.png',
    'assets/images/Ekran Resmi 2025-05-26 17.12.38.png',
    'assets/images/Ekran Resmi 2025-05-26 17.12.42.png',
    'assets/images/Ekran Resmi 2025-05-26 17.12.49.png',
    'assets/images/Ekran Resmi 2025-05-26 17.12.56.png',
    'assets/images/Ekran Resmi 2025-05-26 17.13.02.png',
    'assets/images/Ekran Resmi 2025-05-26 17.13.07.png',
    'assets/images/Ekran Resmi 2025-05-26 17.17.50.png',
    'assets/images/Ekran Resmi 2025-05-26 17.17.58.png',
    'assets/images/Ekran Resmi 2025-05-26 17.18.06.png',
    'assets/images/Ekran Resmi 2025-05-26 17.18.14.png',
    'assets/images/Ekran Resmi 2025-05-26 17.18.22.png',
    'assets/images/Ekran Resmi 2025-05-26 17.18.27.png',
    'assets/images/Ekran Resmi 2025-05-26 17.18.32.png',
    'assets/images/Ekran Resmi 2025-05-26 17.18.37.png',
    'assets/images/Ekran Resmi 2025-05-26 17.18.43.png',
  ];

  final List<String> appStoreLinks = [
    'https://apps.apple.com/tr/app/ai-yearbook-generator/id6468995931',
    'https://apps.apple.com/tr/app/interior-magic-ai/id6449483097',
    'https://apps.apple.com/tr/app/sakura-anime-ai-filter/id6447250609',
    'https://apps.apple.com/tr/app/teleprompter-application/id1669501300',
    'https://apps.apple.com/tr/app/astra-ai-video-avatars/id6446231105',
    'https://apps.apple.com/tr/app/vision-ai-avatar-creator/id1659708041',
    'https://apps.apple.com/tr/app/tofy-baby-sleep-white-noise/id1602210371',
    'https://apps.apple.com/tr/app/secret-vault-hide-your-data/id1587893888',
    'https://apps.apple.com/tr/app/easy-scanner-simple-scan/id1578889257',
    'https://apps.apple.com/tr/app/scanmath-math-problem-solver/id1579327832',
    'https://apps.apple.com/tr/app/adblocker-website-ad-blocker/id1576153746',
    'https://apps.apple.com/tr/app/sleep-sound-white-noise/id1572693948',
    'https://apps.apple.com/tr/app/kids-sleep-sounds-meditation/id1571680679',
    'https://apps.apple.com/tr/app/font-manager-text-changer/id1532647924',
    'https://apps.apple.com/tr/app/highlight-maker-story-covers/id1529429604',
    'https://apps.apple.com/tr/app/bree-breathing-exercises/id1527756593',
    'https://apps.apple.com/tr/app/hypnosis-mindfullness/id1555060954',
    'https://apps.apple.com/tr/app/motivation-daily-affirmation/id1555060437',
  ];

  final List<String> movieTitles = [
    'AI Yearbook Generator',
    'Interior Magic AI',
    'Sakura - Anime AI Filter',
    'Teleprompter Application',
    'Astra AI : Video Avatars',
    'Vision AI : Avatar Creator',
    'Tofy: Baby Sleep & White Noise',
    'Secret Vault : Hide Your Data',
    'Easy Scanner : Simple Scan',
    'ScanMath : Math Problem Solver',
    'Adblocker : Website Ad Blocker',
    'Sleep Sound & White Noise',
    'Kids Sleep Sounds & Meditation',
    'Font Manager & Text Changer',
    'Highlight Maker : Story Covers',
    'Bree : Breathing Exercises',
    'Hypnosis  Mindfullness ',
    'Motivation : Daily Affirmation',
  ];

  final List<String> releaseDates = [
    '2023-01-01',
    '2023-02-10',
    '2023-03-15',
    '2023-04-20',
    '2023-05-25',
    '2023-06-30',
    '2023-07-04',
    '2023-08-08',
    '2023-09-12',
    '2023-10-16',
    '2023-11-20',
    '2023-12-25',
    '2024-01-01',
    '2024-02-05',
    '2024-03-10',
    '2024-04-15',
    '2024-05-20',
    '2024-06-25',
  ];

  final List<String> appCategories = [
    'Productivity',
    'Photography',
    'Entertainment',
    'Utility',
    'Video',
    'Avatar',
    'Health',
    'Security',
    'Tools',
    'Education',
    'Web',
    'Relaxation',
    'Kids',
    'Fonts',
    'Design',
    'Health',
    'Mindfulness',
    'Motivation',
  ];

  final Set<int> selectedIndexes = {};

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      selectedIndexes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      body: RefreshIndicator(
        onRefresh: _refresh,
        color: Colors.redAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: moviePosters.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 20,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              final isSelected = selectedIndexes.contains(index);

              return CupertinoContextMenu(
                actions: [
                  CupertinoContextMenuAction(
                    child: Text(isSelected
                        ? 'Remove from favourite'
                        : 'Add to favourite '),
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        if (isSelected) {
                          selectedIndexes.remove(index);
                        } else {
                          selectedIndexes.add(index);
                        }
                      });
                    },
                  ),
                  CupertinoContextMenuAction(
                    child: const Text('İptal'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    isDestructiveAction: true,
                  ),
                ],
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          appUrl: appStoreLinks[index % appStoreLinks.length],
                          appIcon: moviePosters[index],
                          appName: movieTitles[index],
                          releaseDate: releaseDates[index],
                          appCategory: appCategories[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    height: 220,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(8),
                      border: isSelected
                          ? Border.all(color: Colors.redAccent, width: 3)
                          : null,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            moviePosters[index],
                            fit: BoxFit.cover,
                          ),
                          Container(
                            alignment: Alignment.center,
                            color: Colors.black.withOpacity(0.4),
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              movieTitles[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          if (isSelected)
                            const Positioned(
                              top: 8,
                              right: 8,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.redAccent,
                                size: 28,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String appIcon;
  final String appName;
  final String releaseDate;
  final String appCategory;
  final String appUrl;

  const DetailScreen({
    Key? key,
    required this.appIcon,
    required this.appName,
    required this.releaseDate,
    required this.appCategory,
    required this.appUrl,
  }) : super(key: key);

  Future<void> _launchAppStoreLink(BuildContext context) async {
    final Uri url = Uri.parse(appUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("URL açılamıyor.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 19,
            ),
            Center(
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Image.asset(
                  appIcon,
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'App Name: $appName',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              'Release Date: $releaseDate',
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Category: $appCategory',
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => _launchAppStoreLink(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 167, 56, 201),
                ),
                child: const Text(
                  "App Store",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
