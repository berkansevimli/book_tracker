import 'package:book_tracker/dialogs/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../model/book.dart';
import '../../../provider/provider.dart';
import '../../../size_config.dart';
import '../../../widgets/default_button.dart';

class BookInformations extends StatefulWidget {
  @override
  _BookInformationsState createState() => _BookInformationsState();

  const BookInformations({
    Key? key,
    required this.book,
  }) : super(key: key);
  final Book book;
}

class _BookInformationsState extends State<BookInformations> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BooksProvider>(context);
    bool isSaved = provider.books
        .where((book) => book.isbn == widget.book.isbn)
        .isNotEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(
            widget.book.title,
            style: headingStyle,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        InformationWidget(title: "Description", info: widget.book.description),
        InformationWidget(title: "Author", info: widget.book.author),
        InformationWidget(title: "Genre", info: widget.book.genre),
        InformationWidget(title: "Publisher", info: widget.book.publisher),
        InformationWidget(
            title: "Published",
            info:
                "${widget.book.published.year.toString().padLeft(4, '0')}-${widget.book.published.month.toString().padLeft(2, '0')}-${widget.book.published.day.toString().padLeft(2, '0')}"),
        InformationWidget(title: "ISBN", info: widget.book.isbn),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(20)),
          child: DefaultButton(
            text: isSaved ? "Remove from List" : "Add To List",
            press: () async {
              isSaved
                  ? provider.removeBook(widget.book)
                  : provider.addBook(widget.book);
              setState(() {
                isSaved = !isSaved;
              });
              showSnackBar(context, isSaved ? "Removed" : "Added");
            },
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(40),
        )
      ],
    );
  }
}

class InformationWidget extends StatelessWidget {
  const InformationWidget({
    Key? key,
    required this.info,
    required this.title,
  }) : super(key: key);

  final String info;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: headingStyle2,
      ),
      subtitle: Text(
        info,
        style: defaultStyle,
      ),
    );
  }
}
