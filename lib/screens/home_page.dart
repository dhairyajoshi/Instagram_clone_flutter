// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:big_mosquito_flutter/AppBlock.dart';
import 'package:big_mosquito_flutter/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_size_getter/file_input.dart';
import 'package:image_size_getter/image_size_getter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc()..add(FetchHomeEvent()),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '𝓘𝓷𝓼𝓽𝓪𝓰𝓻𝓪𝓶',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.add_box_outlined, size: 35),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        CustomIcons.facebook_messenger,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 80,
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://avatars.githubusercontent.com/u/46091892?v=4'),
                                radius: 27,
                                backgroundColor:
                                    Color.fromARGB(255, 75, 74, 74),
                              ),
                              Text(
                                'Your Story',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color.fromARGB(255, 219, 215, 215)),
                              )
                            ],
                          ),
                        ),
                        StoryItem(),
                        StoryItem(),
                        StoryItem(),
                        StoryItem(),
                        StoryItem(),
                        StoryItem(),
                        StoryItem(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BlocBuilder<HomePageBloc, AppState>(
                    builder: ((context, state) {
                      if (state is HomeLoadingState) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is HomeLoadedState) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.posts.length,
                          itemBuilder: (context, index) {
                            return FeedPost(post: state.posts[index]);
                          },
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryItem extends StatelessWidget {
  const StoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: Color.fromARGB(255, 75, 74, 74),
          ),
          Text(
            'friend',
            style: TextStyle(
                fontSize: 12, color: Color.fromARGB(255, 219, 215, 215)),
          )
        ],
      ),
    );
  }
}

class FeedPost extends StatelessWidget {
  String post;
  FeedPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = Image.network(post);
    // final file = File(post);
    // final size = ImageSizeGetter.getSize(FileInput(file));

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/a/ac/Default_pfp.jpg'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'dhairyajoshi_',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Esplanade',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                Icon(Icons.menu)
              ],
            ),
          ),
          image,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Icon(Icons.favorite_outline,size: 30,),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(Icons.comment_rounded,size: 30),
                  SizedBox(width:15),
                  Icon(Icons.arrow_forward_rounded,size: 30)
                ]),
                Icon(Icons.bookmark_outline,size: 30)
              ],
            ),
          )
        ],
      ),
    );
  }
}
