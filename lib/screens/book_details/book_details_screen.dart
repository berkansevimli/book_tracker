import 'package:book_tracker/constants.dart';
import 'package:book_tracker/provider/provider.dart';
import 'package:book_tracker/screens/book_details/components/book_informations.dart';
import 'package:book_tracker/screens/book_details/components/book_image.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../size_config.dart';
import '../../model/book.dart';

class BookDetailsScreen extends StatefulWidget {
  BookDetailsScreen({Key? key, required this.book, required this.isSaved})
      : super(key: key);
  final Book book;
  final bool isSaved;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BooksProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Details"),
      ),
      body: ListView(
        children: [
          BookImage(
            img: widget.book.image,
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          BookInformations(
            book: widget.book,
          ),
        ],
      ),
    );
  }
}
