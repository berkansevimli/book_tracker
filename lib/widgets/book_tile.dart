import 'package:book_tracker/provider/provider.dart';
import 'package:book_tracker/screens/home/model/book.dart';
import 'package:book_tracker/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookTile extends StatefulWidget {
  const BookTile({Key? key, required this.book}) : super(key: key);
  final Book book;

  @override
  State<BookTile> createState() => _BookTileState();
}

class _BookTileState extends State<BookTile> {
  @override
  Widget build(BuildContext context) {
    //double screenWidth = SizeConfig.screenWidth;

    //final provider = Provider.of<BooksProvider>(context);

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          onTap: () {
            print("object");
          },
          leading: Container(
            height: SizeConfig.screenWidth * 0.4,
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(8),
            ),

            /*
                  I used CachedNetwork Image but api returns same link every loads. image doesn't change because of it's in cache. 
                  So, I used Image.network instead of CachedNetworkImage.
                  */

            // child: CachedNetworkImage(
            //   imageUrl: img!,
            //   placeholder: (context, url) => Padding(
            //     padding: const EdgeInsets.all(32.0),
            //     child: new Image.asset('assets/icons/loading.gif'),
            //   ),
            //   errorWidget: (context, url, error) => new Icon(Icons.error),
            // ),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: NetworkImage(widget.book.image),
              ),
            ),
          ),
          title: Text(
            widget.book.title,
            style: TextStyle(color: Colors.black, fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.book.author,
                style: TextStyle(color: Colors.lightBlue),
              ),
              Text(
                'Genre: ' + widget.book.genre,
              ),
              Text(
                'Published: ' +
                    "${widget.book.published.year.toString().padLeft(4, '0')}-${widget.book.published.month.toString().padLeft(2, '0')}-${widget.book.published.day.toString().padLeft(2, '0')}",
              ),
            ],
          ),
          trailing: IconButton(
              onPressed: () async {}, icon: Icon(Icons.favorite_border)),
        ));
  }
}
