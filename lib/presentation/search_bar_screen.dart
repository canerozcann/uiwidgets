import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class SearchablePersonPage extends StatefulWidget {
  final String? name;
  final String? surname;

  const SearchablePersonPage({
    Key? key,
    this.name,
    this.surname,
  }) : super(key: key);

  @override
  State<SearchablePersonPage> createState() => _SearchablePersonPageState();
}

class Person {
  final String name;
  final String surname;

  Person(this.name, this.surname);
}

class _SearchablePersonPageState extends State<SearchablePersonPage> {
  final TextEditingController _searchController = TextEditingController();

  final List<Person> allPersons = [
    Person('Caner', 'Özcan'),
    Person('Neon', 'Apps'),
    Person('Mickey', 'Mouse'),
    Person('Fatma', 'Çelik'),
    Person('Ali', 'Şahin'),
    Person('Zeynep', 'Yıldız'),
    Person('Hasan', 'Kurt'),
    Person('Emine', 'Arslan'),
    Person('Mustafa', 'Aydın'),
    Person('Hatice', 'Koç'),
    Person('Merve', 'Eren'),
    Person('Burak', 'Taş'),
    Person('Can', 'Bozkurt'),
    Person('Elif', 'Özdemir'),
    Person('Hüseyin', 'Kaya'),
    Person('Melisa', 'Bulut'),
    Person('Yusuf', 'Kaplan'),
    Person('Gamze', 'Güneş'),
    Person('Seda', 'Doğan'),
    Person('Uğur', 'Aksoy'),
    Person('Betül', 'Çetin'),
    Person('İsmail', 'Polat'),
    Person('Rabia', 'Sarı'),
    Person('Onur', 'Tunç'),
    Person('Selin', 'Sezer'),
    Person('Kerem', 'Acar'),
    Person('Sinem', 'İnce'),
    Person('Okan', 'Ersoy'),
    Person('Büşra', 'Yavuz'),
    Person('Barış', 'Erkan'),
  ];

  late List<Person> filteredPersons;

  @override
  void initState() {
    super.initState();

    filteredPersons = allPersons;

    _searchController.addListener(_filterList);

    if (widget.name != null || widget.surname != null) {
      final query =
          '${widget.name ?? ''} ${widget.surname ?? ''}'.toLowerCase();
      filteredPersons = allPersons.where((p) {
        final fullName = '${p.name} ${p.surname}'.toLowerCase();
        return fullName.contains(query);
      }).toList();
    }
  }

  void _filterList() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredPersons = allPersons.where((person) {
        final fullName = '${person.name} ${person.surname}'.toLowerCase();
        return fullName.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'İsim veya soyisim ara...',
                prefixIcon: const Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(
                      label: Text(
                    'İsim',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  )),
                  DataColumn(
                      label: Text(
                    'Soyisim',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  )),
                ],
                rows: filteredPersons.map((person) {
                  return DataRow(
                    cells: [
                      DataCell(Text(
                        person.name,
                        style: TextStyle(color: Colors.white),
                      )),
                      DataCell(Text(
                        person.surname,
                        style: TextStyle(color: Colors.white),
                      )),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}
