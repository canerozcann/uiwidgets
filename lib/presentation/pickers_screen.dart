import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class PickersScreen extends StatefulWidget {
  const PickersScreen({super.key});

  @override
  State<PickersScreen> createState() => _PickersScreenState();
}

class _PickersScreenState extends State<PickersScreen> {
  File? _selectedImage;
  String _selectedFont = 'Roboto';
  DateTime? _selectedDate;
  Color _backgroundColor = Colors.white;

  final List<String> _fonts = [
    'Roboto',
    'Lobster',
    'Open Sans',
    'Oswald',
    'Pacifico',
    'Playfair Display',
  ];

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });
    }
  }

  Future<void> _pickDate() async {
    DateTime now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _pickColor() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Renk Seçin'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: _backgroundColor,
            onColorChanged: (color) {
              setState(() {
                _backgroundColor = color;
              });
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nameStyle = GoogleFonts.getFont(
      color: Colors.white,
      _selectedFont,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    final ageStyle = GoogleFonts.getFont(
      _selectedFont,
      fontSize: 16,
      color: Colors.white,
    );

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: _backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : const AssetImage('assets/images/mail-.jpg')
                            as ImageProvider,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Caner Özcan', style: nameStyle),
                      const SizedBox(height: 4),
                      Text(
                        _selectedDate != null
                            ? 'Age: ${DateTime.now().year - _selectedDate!.year}'
                            : 'Age: Not Selected',
                        style: ageStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.photo),
              label: const Text("Select Photo from Gallery"),
            ),
            const SizedBox(height: 30),
            const Text(
              "(Select Font)",
              style: TextStyle(fontSize: 16),
            ),
            DropdownButton<String>(
              value: _selectedFont,
              items: _fonts
                  .map((font) => DropdownMenuItem(
                        value: font,
                        child: Text(font, style: GoogleFonts.getFont(font)),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _selectedFont = value;
                  });
                }
              },
              hint: const Text(
                "Select Font",
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _pickDate,
              icon: const Icon(Icons.calendar_today),
              label: const Text("Select Date of Birth"),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _pickColor,
              icon: const Icon(Icons.color_lens),
              label: const Text("Select Background Color"),
            ),
          ],
        ),
      ),
    );
  }
}
