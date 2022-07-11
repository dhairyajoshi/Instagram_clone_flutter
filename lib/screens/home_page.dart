// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:big_mosquito_flutter/bloc/AppBlock.dart';
import 'package:big_mosquito_flutter/bloc/home_bloc.dart';
import 'package:big_mosquito_flutter/custom_icons_icons.dart';
import 'package:big_mosquito_flutter/models/postModel.dart';
import 'package:big_mosquito_flutter/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc()..add(FetchHomeEvent()),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 5),
        child: BlocBuilder<HomePageBloc, AppState>(
          builder: (context, state) {
            if (state is HomeLoadedState) {
              return Column(
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
                            PopupMenuButton(
                              onSelected: (value) {
                                BlocProvider.of<HomePageBloc>(context)
                                    .add(ChangeHomePostState(value.toString()));
                              },
                              icon: Icon(
                                Icons.add_box_outlined,
                                size: 30,
                              ),
                              offset: Offset(0.0, 40),
                              itemBuilder: (context) {
                                return state.items.map<PopupMenuItem<String>>(
                                    (String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(choice),
                                  );
                                }).toList();
                              },
                            ),
                            SizedBox(
                              width: 5,
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
                                          color: Color.fromARGB(
                                              255, 219, 215, 215)),
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
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.posts.length,
                          itemBuilder: (context, index) {
                            return FeedPost(post: state.posts[index]);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is CreatePostState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: [
                      IconButton(
                        onPressed: (() => BlocProvider.of<HomePageBloc>(context)
                            .add(ChangeHomePostState('home'))), 
                        icon: Icon(Icons.arrow_back),
                      ),
                      IconButton(onPressed: () => BlocProvider.of<HomePageBloc>(context).add(UploadPostEvent()), icon: Icon(Icons.check))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (value) => BlocProvider.of<HomePageBloc>(context).setCaption(value),
                          decoration: InputDecoration(
                            hintText: 'Add a caption',
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 15),
                          child: Image.file(File(state.image!.path)),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
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
  Post post;
  FeedPost({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = Image.network(post.pic);
    // final file = File(post);
    // final size = ImageSizeGetter.getSize(FileInput(file));

    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      backgroundImage: NetworkImage(post.pfp),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.username,
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
                Icon(MyFlutterApp.kebab_vertical)
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(minHeight: 300),
            child: image,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Icon(
                    Icons.favorite_outline,
                    size: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(MyFlutterApp.comment_empty, size: 25),
                  SizedBox(width: 15),
                  Icon(MyFlutterApp.paper_plane, size: 25)
                ]),
                Icon(Icons.bookmark_outline, size: 30),
              ],
            ),
          ),
          if (post.caption.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 3),
              child: Row(
                children: [
                  Text(
                    post.username,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(post.caption)
                ],
              ),
            ),
        ],
      ),
    );
  }
}
