// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:book_tracker/model/book.dart' as _i5;
import 'package:book_tracker/screens/book_details/book_details_screen.dart'
    as _i2;
import 'package:book_tracker/screens/home/home_screen.dart' as _i1;
import 'package:flutter/material.dart' as _i4;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeScreen.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomeScreen());
    },
    BookDetailsScreen.name: (routeData) {
      final args = routeData.argsAs<BookDetailsScreenArgs>();
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.BookDetailsScreen(
              key: args.key, book: args.book, isSaved: args.isSaved));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(HomeScreen.name, path: '/'),
        _i3.RouteConfig(BookDetailsScreen.name, path: '/book-details-screen')
      ];
}

/// generated route for
/// [_i1.HomeScreen]
class HomeScreen extends _i3.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '/');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i2.BookDetailsScreen]
class BookDetailsScreen extends _i3.PageRouteInfo<BookDetailsScreenArgs> {
  BookDetailsScreen(
      {_i4.Key? key, required _i5.Book book, required bool isSaved})
      : super(BookDetailsScreen.name,
            path: '/book-details-screen',
            args:
                BookDetailsScreenArgs(key: key, book: book, isSaved: isSaved));

  static const String name = 'BookDetailsScreen';
}

class BookDetailsScreenArgs {
  const BookDetailsScreenArgs(
      {this.key, required this.book, required this.isSaved});

  final _i4.Key? key;

  final _i5.Book book;

  final bool isSaved;

  @override
  String toString() {
    return 'BookDetailsScreenArgs{key: $key, book: $book, isSaved: $isSaved}';
  }
}
