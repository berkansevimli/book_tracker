import 'package:book_tracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../size_config.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: SizeConfig.screenWidth / 1.5,
            child: Lottie.asset('assets/lotties/empty.json')),
        SizedBox(
          height: getProportionateScreenHeight(40),
        ),
        Text("No books added yet", style: headingStyle2)
      ],
    ));
  }
}
