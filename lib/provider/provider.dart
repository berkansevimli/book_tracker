import 'package:flutter/material.dart';

import '../screens/home/model/book.dart';

class BooksProvider  extends ChangeNotifier {

  List<Book> _books = [];

  List<Book> get books => _books;

  void addBook(Book book) {
    _books.add(book);
    notifyListeners();
  }

  void removeBook(Book book) {
    _books.remove(book);
    notifyListeners();
  }
  
}