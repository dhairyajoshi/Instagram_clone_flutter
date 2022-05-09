// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:big_mosquito_flutter/custom_icons_icons.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 5,),
                  Text('Instagram',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.add_box_outlined, size: 35),
                  SizedBox(width: 10,),
                  Icon(CustomIcons.facebook_messenger,color: Colors.white,size: 25,),
                  SizedBox(width: 5,)
                ],
              )
            ],
          ),

          
        ],
      ),
    );
  }
}