import 'package:book_tracker/screens/app_settings/widgets/change_thema.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'components/app_Settings_menu.dart';

class AppSettings extends StatefulWidget {
  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AppSettingsMenu(
            press: () {},
            text: "Dark Mode",
            icon: Icon(Icons.dark_mode),
            widget: ChangeThemeWidget(),
          ),
        ],
      ),
    );
  }
}
