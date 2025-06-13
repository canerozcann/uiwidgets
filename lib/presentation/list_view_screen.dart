import 'package:flutter/material.dart';
import 'package:uiwidgets/custom_app_bar.dart';
import 'package:shimmer/shimmer.dart';

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  bool isLoading = true;
  final List<Map<String, String>> newsList = [
    {
      'title': 'New Era in the Economy',
      'description':
          'The Central Bank decided to keep interest rates unchanged in the latest meeting, signaling a cautious approach amidst global economic uncertainties. Experts believe this move aims to support sustainable growth while keeping inflation under control over the coming months.',
      'image': 'assets/images/news1.webp',
    },
    {
      'title': 'Big Move from Tech Giants',
      'description':
          'Leading technology companies have unveiled a series of innovative AI-based products that promise to revolutionize various industries. These advancements include smarter virtual assistants, improved data analytics tools, and next-generation machine learning platforms designed to enhance user experience and productivity.',
      'image': 'assets/images/news2.webp',
    },
    {
      'title': 'Big Move from Tech Giants',
      'description':
          'In a bold strategic push, major tech players are accelerating the deployment of AI technologies across their product lines. These efforts focus on integrating artificial intelligence to optimize processes, automate routine tasks, and provide personalized services to customers worldwide, shaping the future of digital interaction.',
      'image': 'assets/images/news1.webp',
    },
    {
      'title': 'Big Move from Tech Giants',
      'description':
          'The recent announcements by top technology firms highlight their commitment to advancing artificial intelligence research and applications. Their new offerings include cutting-edge AI-driven software, cloud-based machine learning services, and innovative hardware designed to support AI workloads more efficiently.',
      'image': 'assets/images/news2.webp',
    },
    {
      'title': 'Big Move from Tech Giants',
      'description':
          'Technology giants continue to invest heavily in AI, aiming to maintain competitive advantage and lead innovation. Their latest AI solutions promise enhanced automation, smarter analytics, and improved user interfaces that cater to evolving consumer demands in an increasingly digital world.',
      'image': 'assets/images/news1.webp',
    },
  ];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Widget _buildShimmerCard() {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[700]!,
          highlightColor: Colors.grey[500]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                color: Colors.grey,
              ),
              const SizedBox(height: 8),
              Container(height: 20, width: 150, color: Colors.grey),
              const SizedBox(height: 8),
              Container(height: 14, width: double.infinity, color: Colors.grey),
              const SizedBox(height: 4),
              Container(height: 14, width: double.infinity, color: Colors.grey),
              const SizedBox(height: 4),
              Container(height: 14, width: 200, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNewsCard(int index) {
    return Card(
      color: Colors.black,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(newsList[index]['image']!),
            SizedBox(height: 8),
            Text(
              newsList[index]['title']!,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 174, 173, 173)),
            ),
            SizedBox(height: 8),
            Text(
              newsList[index]['description']!,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Icon(
                Icons.linear_scale_rounded,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(),
      body: isLoading
          ? ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) => _buildShimmerCard(),
            )
          : ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) => _buildNewsCard(index),
            ),
    );
  }
}
