import 'dart:convert';

import 'package:book_tracker/screens/home/model/book.dart';
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
                return Container(
                  margin: EdgeInsets.only(bottom: 8, left: 8, right: 8),
                  child: Swipeable(
                    threshold: MediaQuery.of(context).size.width * 0.2,
                    onSwipeLeft: () {
                      print("edit");
                    },
                    onSwipeRight: () {
                      showDialog(
                          context: context,
                          builder: (builder) => CupertinoAlertDialog(
                                title: Text("Delete"),
                                content: Text(
                                    "Are you sure you want to delete this user?"),
                                actions: [
                                  CupertinoDialogAction(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  CupertinoDialogAction(
                                    child: Text("Delete"),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      //deleteUser(bookResults.data[index].id, context);
                                    },
                                  )
                                ],
                              ));
                    },
                    background: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: ListTile(
                        title: Text(
                            "${bookResults.data[index].id.toString()} ${bookResults.data![index].title}"),
                        subtitle: Text(bookResults.data![index].author),
                        leading: Icon(Icons.delete, color: Colors.red),
                        trailing: Icon(Icons.edit, color: Colors.blue),
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          color: Colors.white),
                      child: ListTile(
                        title: Text(
                            "${bookResults.data[index].id.toString()} ${bookResults.data![index].title}"),
                        subtitle: Text(bookResults.data![index].author),
                        onTap: () {
                          print(bookResults.data[index].id);
                        },
                      ),
                    ),
                  ),
                );
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
        return result;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
