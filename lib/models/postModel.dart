import 'package:flutter/foundation.dart';

class Post {
  String caption;
  String username;
  String pic;
  String pfp;
  int likes;
  String date;
  String status;

  Post(this.caption, this.username, this.pic, this.pfp, this.likes, this.date,
      this.status);

  factory Post.fromJson(Map<String, dynamic> json) => Post(
      json['caption'],
      json['username'],
      'https://apps-ourspace.herokuapp.com'+json['pic'],
      'https://apps-ourspace.herokuapp.com'+json['pfp'], 
      json['likes'],
      json['date'],
      json['status']);
}
