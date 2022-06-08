import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class AppSettingsMenu extends StatelessWidget {
  const AppSettingsMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
    required this.widget,
  }) : super(key: key);

  final String text;
  final Icon icon;
  final Widget widget;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        onPressed: press,
        child: Row(
          children: [
            icon,
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            widget
          ],
        ),
      ),
    );
  }
}
