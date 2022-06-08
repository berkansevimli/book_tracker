import 'package:book_tracker/provider/provider.dart';
import 'package:book_tracker/screens/home/view/home_screen.dart';
import 'package:book_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BooksProvider(),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            home: const HomeScreen(),
          );
        });
  }
}
