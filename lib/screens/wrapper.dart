// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:big_mosquito_flutter/custom_icons_icons.dart';
import 'package:big_mosquito_flutter/screens/explore_page.dart';
import 'package:big_mosquito_flutter/screens/home_page.dart';
import 'package:big_mosquito_flutter/screens/notifications_page.dart';
import 'package:big_mosquito_flutter/screens/profile_page.dart';
import 'package:big_mosquito_flutter/screens/reels_page.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _selectedIndex = 0;
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Display(screen: _page),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        // padding: EdgeInsets.symmetric(vertical: 1),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            enableFeedback: false,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(_page==0? Icons.home: Icons.home_outlined, size: 27),
            onPressed: () {
              setState(() {
                _page = 0;
              });
            },
          ),
          IconButton(
            enableFeedback: false,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(Icons.search, size: 27),
            onPressed: () {
              setState(() {
                _page = 1;
              });
            },
          ),
          IconButton(
            enableFeedback: false,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(CustomIcons.instagram_reel, size: 27),
            onPressed: () {
              setState(() {
                _page = 2;
              });
            },
          ),
          IconButton(
            enableFeedback: false,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(_page==3? Icons.favorite:Icons.favorite_outline, size: 27),
            onPressed: () {
              setState(() {
                _page = 3;
              });
            },
          ),
          IconButton(
            enableFeedback: false,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: Icon(_page==4?Icons.person: Icons.person_outline, size: 27),
            onPressed: () {
              setState(() {
                _page = 4;
              });
            },
          ),
        ]),
      ),
    );
  }
}

class Display extends StatelessWidget {
  Display({Key? key, required this.screen}) : super(key: key);

  int screen;

  @override
  Widget build(BuildContext context) {
    switch (screen) {
      case 0:
        return HomePage();
      case 1:
        return ExplorePage();
      case 2:
        return ReelsPage();
      case 3:
        return NotificationPage();
      case 4:
        return ProfilePage();
      default:
        return ProfilePage();
    }
  }
}
