// ignore_for_file: unused_local_variable

import 'package:big_mosquito_flutter/Services/localDbServices.dart';
import 'package:big_mosquito_flutter/models/userModel.dart';
import 'package:big_mosquito_flutter/models/objectbox.g.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:objectbox/objectbox.dart';

import 'package:shared_preferences/shared_preferences.dart';
class AuthServices{
  String baseUrl='https://insta-clone-dj.herokuapp.com';
  
 

  Future<bool> checkAuthStatus() async{
    final pref = await SharedPreferences.getInstance();

    final token = pref.getString('token');
    Map<String,String> headers={
      'Authorization':'Bearer $token',
    };
    final response = await http.get(Uri.parse('$baseUrl/users/getinfo'),headers: headers);


    final jsondata= json.decode(response.body);
    if(jsondata['msg']=='authenticated'){
      
    final user = UserModel.fromJson(jsondata['user']);

    LocalDatabase().putUser(user);
    }

    return jsondata['msg']=='authenticated'; 
  }

  Future<bool> login(String usn,String pass) async{


    final response = await http.post(Uri.parse('$baseUrl/users/login/'),body: {'username':usn,'password':pass});

    final jsondata=json.decode(response.body);

    print(jsondata); 


    // if(jsondata['msg']=='logged in successfully'){
    // final user = UserModel.fromJson(jsondata['user']);

    // LocalDatabase().putUser(user);

    //   final pref = await SharedPreferences.getInstance();
    //   await pref.setString('token', jsondata['token']);
    //   return true;
    // }
    return false;
  }
}