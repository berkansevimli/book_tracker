import 'package:book_tracker/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BooksProvider>(context);

    return Switch.adaptive(
        value: provider.isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<BooksProvider>(context, listen: false);
          provider.toggleTheme(value);
        });
  }
}
