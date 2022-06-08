import 'dart:convert';

import 'package:book_tracker/screens/home/model/book.dart';
import 'package:book_tracker/widgets/book_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';
import '../../../../widgets/swipeable.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int counter = 0;
  var bookResults;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return bookResults != null
        ? Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ListView.builder(
              itemCount: counter,
              itemBuilder: (context, index) {
                return BookTile(book: bookResults.data[index]);
              },
            ),
          )
        : Center(child: CircularProgressIndicator());
  }

  Future fetchBooks() async {
    try {
      final response = await http.get(baseURL);
      if (response.statusCode == 200) {
        var result = await GetBooks.fromJson(json.decode(response.body));
        if (mounted) {
          setState(() {
            counter = result.total;
            bookResults = result;
          });
        }
        print(result.data[1].image);
        return result;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
