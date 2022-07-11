import 'dart:io';
import 'package:big_mosquito_flutter/models/postModel.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class DatabaseService {
  String baseUrl = 'https://apps-ourspace.herokuapp.com';
  // String baseUrl='http://10.0.2.2:8000';
  Future<List<String>> getPhotos() async {
    final urlList = <String>[];

    final response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/?client_id=d87SUWp7Zq3QiveVkBQb3muzKQM3M4VjKNu_onrGOHM'));

    if (response.statusCode == 200) {
      final photos = json.decode(response.body);

      for (int i = 0; i < photos.length; i++) {
        urlList.add(photos[i]['urls']['small']);
      }
      for (int i = 0; i < photos.length; i++) {
        urlList.add(photos[i]['urls']['small']);
      }
      for (int i = 0; i < photos.length; i++) {
        urlList.add(photos[i]['urls']['small']);
      }
    }
    return urlList;
  }

  Future<List<Post>> getPosts() async {
    final posts = <Post>[];

    final pref = await SharedPreferences.getInstance();

    final token = pref.getString('token');

    final response = await http.get(Uri.parse('$baseUrl/post/getposts'),
        headers: {'Authorization': 'Bearer $token'});

    final jsondata = json.decode(response.body);

    for (int i = 0; i < jsondata.length; i++) {
      // print(jsondata[i]);
      posts.add(Post.fromJson(jsondata[i]));
    }

    return posts;
  }

  Future<List<Post>> getUserPosts() async {
    final posts = <Post>[];

    final pref = await SharedPreferences.getInstance();

    final token = pref.getString('token');

    final response = await http.get(Uri.parse('$baseUrl/post/getuserposts'),
        headers: {'Authorization': 'Bearer $token'});

    final jsondata = json.decode(response.body);

    for (int i = 0; i < jsondata.length; i++) {
      posts.add(Post.fromJson(jsondata[i]));
    }

    return posts;
  }

  uploadPost(XFile file, String caption) async {
    final pref = await SharedPreferences.getInstance();

    final token = pref.getString('token');
    var request =
        http.MultipartRequest('POST', Uri.parse('$baseUrl/post/addpost'));
        request.fields.addAll({'caption':caption});

    request.headers.addAll({'Authorization': 'Bearer $token'});

    request.files.add(
      http.MultipartFile('pic', File(file.path).readAsBytes().asStream(),
          File(file.path).lengthSync(),
          filename: file.path.split("/").last),
    );

    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    final result = jsonDecode(response.body) as Map<String, dynamic>; 

    return result['msg']; 
  }
}
