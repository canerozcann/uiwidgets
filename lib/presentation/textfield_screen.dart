import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/buttons_widgets/action_dropdown_widget.dart';
import 'package:uiwidgets/custom_app_bar.dart';
import 'package:uiwidgets/textfield_widgets/input_fields_widgets.dart';
import 'package:uiwidgets/textfield_widgets/validate_widgets.dart';

@RoutePage()
class TextfieldScreen extends StatefulWidget {
  const TextfieldScreen({super.key});

  @override
  State<TextfieldScreen> createState() => _TextfieldScreenState();
}

class _TextfieldScreenState extends State<TextfieldScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            UserInputFields(),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.white,
              thickness: 1,
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            ValidatedUserInputFields(),
          ]),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
