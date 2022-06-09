import 'package:auto_route/auto_route.dart';
import 'package:book_tracker/main.dart';
import 'package:book_tracker/screens/book_details/book_details_screen.dart';
import 'package:book_tracker/screens/home/home_screen.dart';


@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(page: BookDetailsScreen, ),
  ],
)
class $AppRouter {}