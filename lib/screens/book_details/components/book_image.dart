import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class BookImage extends StatelessWidget {
  final String? img;

  const BookImage({Key? key, required this.img}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight/2,
      child: CachedNetworkImage(
        imageUrl: img!,
        fit: BoxFit.cover,
        placeholder: (context, url) => Padding(
          padding: const EdgeInsets.all(32.0),
          child: new Image.asset('assets/icons/loading.gif'),
        ),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      ),
    );
  }
}
