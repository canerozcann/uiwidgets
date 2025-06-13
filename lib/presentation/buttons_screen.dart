import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uiwidgets/buttons_widgets/action_dropdown_widget.dart';
import 'package:uiwidgets/buttons_widgets/dropdown_special_button_widget.dart';
import 'package:uiwidgets/buttons_widgets/focused_color_button_widget.dart';
import 'package:uiwidgets/buttons_widgets/robber_heist_button_widget.dart';
import 'package:uiwidgets/buttons_widgets/toggle_widget.dart';
import 'package:uiwidgets/custom_app_bar.dart';

@RoutePage()
class ButtonsScreen extends StatefulWidget {
  const ButtonsScreen({super.key});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 60),
              child: ActionDropdownWidget(),
            ),
            SizedBox(height: 16),
            DailySpecialDropdown(),
            SizedBox(
              height: 20,
            ),
            FocusedColorButtonWidget(icon: Icon(Icons.abc_outlined, size: 32)),
            SizedBox(
              height: 20,
            ),
            ToggleButtonWidget(),
            Text(
              "Click the button to open the vault",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 40,
            ),
            HeistButton(
                closedImage: "assets/images/lockedVault.png",
                openImage: "assets/images/openVault.png")
          ],
        ),
      ),
    );
  }
}
