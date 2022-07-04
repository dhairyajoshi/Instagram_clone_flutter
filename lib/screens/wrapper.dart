// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables
import 'package:big_mosquito_flutter/AppBlock.dart';
import 'package:bloc/bloc.dart';
import 'package:big_mosquito_flutter/custom_icons_icons.dart';
import 'package:big_mosquito_flutter/screens/explore_page.dart';
import 'package:big_mosquito_flutter/screens/home_page.dart';
import 'package:big_mosquito_flutter/screens/notifications_page.dart';
import 'package:big_mosquito_flutter/screens/profile_page.dart';
import 'package:big_mosquito_flutter/screens/reels_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> WrapperBloc(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<WrapperBloc,AppState>(builder: (context, state) {
            if(state is HomePageState){
              return HomePage();
            }
            if(state is ExplorePageState){
              return ExplorePage();
            }
            if(state is ReelsPageState){
              return ReelsPage();
            }
            if(state is NotificationPageState){
              return NotificationPage();
            }
            if(state is ProfilePageState){
              return ProfilePage();
            }
            return HomePage();
          },),
          // child: Display(screen: _page),
        ),
        bottomNavigationBar: BlocBuilder<WrapperBloc,AppState>(
          builder: (context, state) {
            return Container(
            color: Colors.black,
            // padding: EdgeInsets.symmetric(vertical: 1),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              IconButton(
                enableFeedback: false,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(state is HomePageState? Icons.home: Icons.home_outlined, size: 27),
                onPressed: () => BlocProvider.of<WrapperBloc>(context).add(ChangeScreenEvent(0)),
              ),
              IconButton(
                enableFeedback: false,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(Icons.search, size: 27),
                onPressed: () => BlocProvider.of<WrapperBloc>(context).add(ChangeScreenEvent(1)),
              ),
              IconButton(
                enableFeedback: false,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(CustomIcons.instagram_reel, size: 27),
                onPressed: () => BlocProvider.of<WrapperBloc>(context).add(ChangeScreenEvent(2)),
              ),
              IconButton(
                enableFeedback: false,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(state is NotificationPageState? Icons.favorite:Icons.favorite_outline, size: 27),
                onPressed: () => BlocProvider.of<WrapperBloc>(context).add(ChangeScreenEvent(3)),
              ),
              IconButton(
                enableFeedback: false,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(state is ProfilePageState?Icons.person: Icons.person_outline, size: 27),
                onPressed: () => BlocProvider.of<WrapperBloc>(context).add(ChangeScreenEvent(4)),
              ),
            ]),
          );
          },
        ),
      ),
    );
  }
  
}

