import 'package:book_tracker/provider/provider.dart';
import 'package:book_tracker/router.gr.dart';
import 'package:book_tracker/screens/home/home_screen.dart';
import 'package:book_tracker/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => BooksProvider(),
        builder: (context, child) {
          final provider = Provider.of<BooksProvider>(context);
          return MaterialApp.router(
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
            themeMode: provider.themeMode,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            
          );
        });
  }
}
