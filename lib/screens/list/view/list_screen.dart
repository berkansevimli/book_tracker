import 'package:book_tracker/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/book_tile.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BooksProvider>(context);

    return ListView.builder(
        itemBuilder: (context, index) {
          return BookTile(book: bookProvider.books[index]);
        },
        itemCount: bookProvider.books.length);
  }
}
