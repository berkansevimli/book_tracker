// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class GetBooks {
    GetBooks({
        required this.status,
        required this.code,
        required this.total,
        required this.data,
    });

    String status;
    int code;
    int total;
    List<Book> data;

    factory GetBooks.fromJson(Map<String, dynamic> json) => GetBooks(
        status: json["status"],
        code: json["code"],
        total: json["total"],
        data: List<Book>.from(json["data"].map((x) => Book.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "total": total,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Book {
    Book({
        required this.id,
        required this.title,
        required this.author,
        required this.genre,
        required this.description,
        required this.isbn,
        required this.image,
        required this.published,
        required this.publisher,
    });

    int id;
    String title;
    String author;
    String genre;
    String description;
    String isbn;
    String image;
    DateTime published;
    String publisher;

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        genre: json["genre"],
        description: json["description"],
        isbn: json["isbn"],
        image: json["image"],
        published: DateTime.parse(json["published"]),
        publisher: json["publisher"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "genre": genre,
        "description": description,
        "isbn": isbn,
        "image": image,
        "published": "${published.year.toString().padLeft(4, '0')}-${published.month.toString().padLeft(2, '0')}-${published.day.toString().padLeft(2, '0')}",
        "publisher": publisher,
    };
}
