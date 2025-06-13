import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/custom_app_bar.dart';
import 'package:uiwidgets/Routes/app_router.gr.dart';

class Kisi {
  final String ad;
  final String soyad;
  final String takim;
  final int yas;
  final String memleket;
  final String posta;

  Kisi({
    required this.ad,
    required this.soyad,
    required this.takim,
    required this.yas,
    required this.memleket,
    required this.posta,
  });
}

@RoutePage()
class DataTableScreen extends StatefulWidget {
  const DataTableScreen({super.key});

  @override
  State<DataTableScreen> createState() => _DataTableScreenState();
}

class _DataTableScreenState extends State<DataTableScreen> {
  final List<Kisi> kisiler = [
    Kisi(
      ad: 'Ali',
      soyad: 'Yılmaz',
      takim: 'Galatasaray',
      yas: 28,
      memleket: 'İstanbul',
      posta: 'ali@example.com',
    ),
    Kisi(
      ad: 'Ayşe',
      soyad: 'Kara',
      takim: 'Fenerbahçe',
      yas: 25,
      memleket: 'Ankara',
      posta: 'ayse@example.com',
    ),
    Kisi(
      ad: 'Mehmet',
      soyad: 'Demir',
      takim: 'Beşiktaş',
      yas: 32,
      memleket: 'İzmir',
      posta: 'mehmet@example.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Scroll right to see the full table →',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Expanded(
            child: Scrollbar(
              thumbVisibility: true,
              trackVisibility: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('First Name')),
                    DataColumn(label: Text('Last Name')),
                    DataColumn(label: Text('Team')),
                    DataColumn(label: Text('Age')),
                    DataColumn(label: Text('Hometown')),
                    DataColumn(label: Text('Email')),
                  ],
                  rows: kisiler.map((kisi) {
                    return DataRow(
                      cells: [
                        DataCell(Text(kisi.ad)),
                        DataCell(Text(kisi.soyad)),
                        DataCell(Text(kisi.takim)),
                        DataCell(Text(kisi.yas.toString())),
                        DataCell(Text(kisi.memleket)),
                        DataCell(Text(kisi.posta)),
                      ],
                      onSelectChanged: (selected) {
                        if (selected == true) {
                          context.router.push(KisiDetailRoute(kisi: kisi));
                        }
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
