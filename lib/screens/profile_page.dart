// ignore_for_file: prefer_const_constructors,prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _selectedIndex = 4;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),  
                      SizedBox(width: 5,),
                      CircleAvatar( 
                        radius: 10,
                        backgroundColor: Colors.transparent,
                        foregroundImage: NetworkImage('https://pngset.com/images/instagram-verified-badge-image-mart-instagram-verified-badge-stencil-gear-machine-transparent-png-2504861.png'),
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
              // Container( 
              //   height: 100,
              //   child: ListView( 
              //     shrinkWrap: true,
              //   children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         CircleAvatar(
              //           radius: 45,
              //           foregroundImage:
              //               NetworkImage('https://dhairya.games/pfp.jpg'),
              //         ),
              //         Column(
              //           children: [
              //             Text('0',
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.bold, fontSize: 18)),
              //             Text(
              //               'Posts',
              //               style: TextStyle(fontSize: 15),
              //             )
              //           ],
              //         ),
              //         Column(
              //           children: [
              //             Text('138',
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.bold, fontSize: 18)),
              //             Text(
              //               'Followers',
              //               style: TextStyle(fontSize: 15),
              //             )
              //           ],
              //         ),
              //         Column(
              //           children: [
              //             Text('170',
              //                 style: TextStyle(
              //                     fontWeight: FontWeight.bold, fontSize: 18)),
              //             Text(
              //               'Following',
              //               style: TextStyle(fontSize: 15),
              //             )
              //           ],
              //         ),
              //       ],
              //     ),
              //     SizedBox(
              //       height: 5,
              //     ),
              //     Text(
              //       "Dhairya Joshi",
              //       style:
              //           TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              //     ),
              //     SizedBox(
              //       height: 2,
              //     ),
              //     Text(
              //       "बदमोश/बदमोशी",
              //       style: TextStyle(fontSize: 14),
              //     ),
              //     SizedBox(
              //       height: 2,
              //     ),
              //     Text(
              //       "स्लिम शेडी",
              //       style: TextStyle(fontSize: 14),
              //     ),
              //     Row(
              //       children: [
              //         Expanded(
              //             flex: 9,
              //             child: OutlinedButton(
              //               style: OutlinedButton.styleFrom(
              //                 side: BorderSide(color: Colors.white),
              //               ),
              //               child: Text(
              //                 'Edit Profile',
              //                 style: TextStyle(color: Colors.white),
              //               ),
              //               onPressed: editProfile,
              //             )),
              //         SizedBox(
              //           width: 5,
              //         ),
              //         Expanded(
              //           child: IconButton(
              //             icon: Icon(
              //               Icons.person_add_outlined,
              //               color: Colors.white,
              //             ),
              //             onPressed: addPeople,
              //           ),
              //         )
              //       ],
              //     ),
              //     SizedBox(
              //       height: 5,
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           'Story Highlights',
              //           style: TextStyle(
              //               fontWeight: FontWeight.bold, fontSize: 15),
              //         ),
              //         SizedBox(
              //           height: 3,
              //         ),
              //         Text('Keep your favourite stories on your profile',
              //             style: TextStyle(fontSize: 13))
              //       ],
              //     ),
              //     SizedBox(
              //       height: 5,
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Column(
              //           children: [
              //             Icon(
              //               Icons.add_circle_outline_sharp,
              //               size: 65,
              //             ),
              //             Text('New')
              //           ],
              //         ),
              //         StoryItem(),
              //         StoryItem(),
              //         StoryItem(),
              //         StoryItem(),
              //       ],
              //     ),
              //     SizedBox(
              //       height: 15,
              //     ),
              //     TabBar(
              //       controller: _tabController,
              //       indicatorSize: TabBarIndicatorSize.tab,
              //       tabs: [
              //         Tab(icon: Icon(Icons.grid_view_outlined)),
              //         Tab(icon: Icon(Icons.assignment_ind_outlined)),
              //       ],
              //     ),
              //     Expanded(
              //       child: TabBarView(
              //         controller: _tabController,
              //         children: [
              //           PhotoGrid(),
              //           PhotoGrid(),
              //         ],
              //       ),
              //     ),
              //   ],
              //   ),
              // )
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 45,
                    foregroundImage:
                        NetworkImage('https://dhairya.games/pfp.jpg'),
                  ),
                  Column(
                    children: [
                      Text('11', 
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(
                        'Posts',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text('138',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(
                        'Followers',
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text('170',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
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
                "बदमोश/बदमोशी",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "स्लिम शेडी",
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
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    PhotoGrid(),
                    PhotoGrid(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
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
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 5,
      children: [
        Image.network(
            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
        Image.network(
            'https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=20&m=517188688&s=612x612&w=0&h=i38qBm2P-6V4vZVEaMy_TaTEaoCMkYhvLCysE7yJQ5Q='),
        Image.network(
            'https://images.pexels.com/photos/302743/pexels-photo-302743.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
        Image.network(
            'https://media.istockphoto.com/photos/picturesque-morning-in-plitvice-national-park-colorful-spring-scene-picture-id1093110112?k=20&m=1093110112&s=612x612&w=0&h=3OhKOpvzOSJgwThQmGhshfOnZTvMExZX2R91jNNStBY='),
        Image.network(
            'https://www.shaadidukaan.com/vogue/wp-content/uploads/2019/08/hug-kiss-images.jpg'),
        Image.network(
            'https://images.unsplash.com/photo-1589041127168-9b1915731dc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8a29sa2F0YXxlbnwwfHwwfHw%3D&w=1000&q=80'),
        Image.network(
            'http://www.goodmorningimagesdownload.com/wp-content/uploads/2019/12/Love-Images-1.jpg'),
        Image.network(
            'https://www.gettyimages.com/gi-resources/images/500px/983703508.jpg'),
        Image.network(
            'https://i.pinimg.com/474x/01/88/dc/0188dc41881e0e410b5375cdead5f49a.jpg'),
        Image.network(
            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
        Image.network(
            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
      ],
    );
  }
}
