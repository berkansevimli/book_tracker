import 'package:book_tracker/model/book.dart';
import 'package:flutter/material.dart';

class BooksProvider  extends ChangeNotifier {

  bool isLoading = false;
  bool get _isLoading => isLoading;

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

  setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
  
}