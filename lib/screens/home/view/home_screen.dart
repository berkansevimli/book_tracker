import 'package:book_tracker/constants.dart';
import 'package:book_tracker/enums.dart';
import 'package:book_tracker/screens/home/view/components/body.dart';
import 'package:book_tracker/screens/list/view/list_screen.dart';
import 'package:book_tracker/size_config.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? 'Home' : 'My List'),
        elevation: 0.2,
        shadowColor: kSecondaryColor,
      ),
      body: _currentIndex == 0 ? Body() : MyList(),
      bottomNavigationBar: buildNavBar(),
    );
  }

  Widget buildNavBar() {
    return CustomNavigationBar(
      iconSize: 30.0,
      unSelectedColor: Color(0xffacacac),
      backgroundColor: Colors.white,
      items: [
    
        CustomNavigationBarItem(
          icon: SvgPicture.asset("assets/icons/home.svg",
              color: _currentIndex == 0 ? kSecondaryColor : Color(0xffacacac)),
          title: Text("Home"),
        ),
        CustomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/save.svg",
            color: _currentIndex == 1 ? kSecondaryColor : Color(0xffacacac),
          ),
          title: Text("My List"),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
