// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:big_mosquito_flutter/Services/database_services.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({ Key? key }) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,
      child: SingleChildScrollView( 
        scrollDirection: Axis.vertical,
        
        child: Column(
          children: [
            TextField(),
            Container(
              height: MediaQuery.of(context).size.height*0.8, 
              child: FutureBuilder(
                future: DatabaseService().getPhotos(),
                builder: (context, AsyncSnapshot snap){
      
                  if(snap.hasData)
                  {
                    return GridView.builder(
                      itemCount: snap.data.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical, 
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 1/1,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2
                      ),
                      itemBuilder: (context, index){
                        return Image.network(snap.data[index],fit: BoxFit.fill,);
                      },
                    );
                  }
      
                  return Center(child: CircularProgressIndicator());
                },
              ),
            )
            
          ],
        ),
      ),
    );
  }
}