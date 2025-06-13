import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class PinokyoAlertPage extends StatelessWidget {
  const PinokyoAlertPage({super.key});

  void showSingleAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        title: Text('Single Alert'),
        content: Text('This alert only has a title and subtitle.'),
      ),
    );
  }

  void showOneButtonAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('One Button Alert'),
        content: const Text('This alert has one button.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              debugPrint('Ok button pressed.');
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void showTwoButtonAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Two Button Alert'),
        content: const Text('Two different button options are offered.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              debugPrint('Confirm button pressed.');
            },
            child: const Text('Confirm'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              debugPrint('Cancel button pressed.');
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void showInputAlert(BuildContext context) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Input Alert'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter text...'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              debugPrint('Entered text: ${controller.text}');
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }

  void showActionSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ListTile(
            title: Text(
              'Select Action',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Choose one of multiple options.',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            title: const Text(
              'Option 1',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(
              'Option 2',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void showActivityController(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black,
      context: context,
      builder: (_) => const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              'Activity Controller',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'File or image sharing options',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(Icons.insert_drive_file),
            title: Text(
              'Share File',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(Icons.image),
            title: Text(
              'Share Image',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 50),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    );

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () => showSingleAlert(context),
              style: buttonStyle,
              child: const Text('1. Show Simple Alert'),
            ),
            const SizedBox(
              height: 7,
            ),
            ElevatedButton(
              onPressed: () => showOneButtonAlert(context),
              style: buttonStyle,
              child: const Text('2. One Button Alert'),
            ),
            const SizedBox(
              height: 7,
            ),
            ElevatedButton(
              onPressed: () => showTwoButtonAlert(context),
              style: buttonStyle,
              child: const Text('3. Two Button Alert'),
            ),
            const SizedBox(
              height: 7,
            ),
            ElevatedButton(
              onPressed: () => showInputAlert(context),
              style: buttonStyle,
              child: const Text('4. Input Alert'),
            ),
            const SizedBox(
              height: 7,
            ),
            ElevatedButton(
              onPressed: () => showActionSheet(context),
              style: buttonStyle,
              child: const Text('5. Action Sheet'),
            ),
            const SizedBox(
              height: 7,
            ),
            ElevatedButton(
              onPressed: () => showActivityController(context),
              style: buttonStyle,
              child: const Text('6. Activity Controller'),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
