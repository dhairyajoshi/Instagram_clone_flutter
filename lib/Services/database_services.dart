import 'package:http/http.dart' as http;
import 'dart:convert';
class DatabaseService{
  Future<List<String>> getPhotos() async{

    final urlList=  <String>[];

    final response = await http.get(Uri.parse('https://api.unsplash.com/photos/?client_id=d87SUWp7Zq3QiveVkBQb3muzKQM3M4VjKNu_onrGOHM'));

    if(response.statusCode==200)
    {
      final photos= json.decode(response.body);

      for(int i=0;i<photos.length;i++)
      {
        urlList.add(photos[i]['urls']['small']);
      }
      for(int i=0;i<photos.length;i++) 
      {
        urlList.add(photos[i]['urls']['small']);
      }
      for(int i=0;i<photos.length;i++)
      {
        urlList.add(photos[i]['urls']['small']);
      } 
    }
    return urlList;
  }
}