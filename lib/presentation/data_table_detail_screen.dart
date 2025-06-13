import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/custom_app_bar.dart';
import 'package:uiwidgets/presentation/data_table_screen.dart';

@RoutePage()
class KisiDetailScreen extends StatelessWidget {
  final Kisi kisi;

  const KisiDetailScreen({super.key, required this.kisi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow('First Name', kisi.ad),
                _buildInfoRow('Last Name', kisi.soyad),
                _buildInfoRow('Team', kisi.takim),
                _buildInfoRow('Age', kisi.yas.toString()),
                _buildInfoRow('Hometown', kisi.memleket),
                _buildInfoRow('Email', kisi.posta),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text('$label: ',
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
