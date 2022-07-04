// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:big_mosquito_flutter/AppBlock.dart';
import 'package:big_mosquito_flutter/Services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _posts=30;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child:
          ListView(shrinkWrap: true, scrollDirection: Axis.vertical, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.lock_outline, size: 30),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "dhairyajoshi_",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.transparent,
                  foregroundImage: NetworkImage(
                      'https://pngset.com/images/instagram-verified-badge-image-mart-instagram-verified-badge-stencil-gear-machine-transparent-png-2504861.png'),
                ),
                Icon(
                  Icons.arrow_drop_down_outlined,
                  color: Colors.grey,
                )
              ],
            ),
            Row(
              children: [
                Icon(Icons.add_box_outlined, size: 35),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.menu_outlined,
                  size: 35,
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 45,
              foregroundImage: NetworkImage('https://avatars.githubusercontent.com/u/46091892?v=4'),
            ),
            Column(
              children: [
                Text('$_posts', 
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(
                  'Posts',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Column(
              children: [
                Text('138',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(
                  'Followers',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            Column(
              children: [
                Text('170',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(
                  'Following',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Dhairya Joshi",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "hello there 👋",
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "I am an app developer",
          style: TextStyle(fontSize: 14),
        ),
        Row(
          children: [
            Expanded(
                flex: 9,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                  ),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: editProfile,
                )),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: IconButton(
                icon: Icon(
                  Icons.person_add_outlined,
                  color: Colors.white,
                ),
                onPressed: addPeople,
              ),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Story Highlights',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 3,
            ),
            Text('Keep your favourite stories on your profile',
                style: TextStyle(fontSize: 13))
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              // ignore:
              children: [
                Icon(
                  Icons.add_circle_outline_sharp,
                  size: 65,
                ),
                Text('New')
              ],
            ),
            StoryItem(),
            StoryItem(),
            StoryItem(),
            StoryItem(),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.grid_view_outlined)),
            Tab(icon: Icon(Icons.assignment_ind_outlined)),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: TabBarView(
            controller: _tabController,
            children: [
              PhotoGrid(),
              PhotoGrid(), 
            ],
          ),
        ),
      ]),
    );
  }

  void editProfile() {}

  void addPeople() {}

  void _onItemTapped(int value) {}

  
}

class StoryItem extends StatelessWidget {
  const StoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 27,
          backgroundColor: Color.fromARGB(255, 75, 74, 74),
        ),
        Text('')
      ],
    );
  }
}

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ProfilePageBloc,AppState>(
      bloc: ProfilePageBloc()..add(FetchPostEvent()),
      builder: (context,state){
        if(state is PostLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }
        if(state is PostLoadedState){
          return GridView.builder(
            itemCount: state.posts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1/1,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2
            ),
            itemBuilder: (context,index){
              return Image.network(state.posts[index]);
            },
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
           );
        }
        return Center(child: CircularProgressIndicator(),);
      } ,
    );
  }
}
