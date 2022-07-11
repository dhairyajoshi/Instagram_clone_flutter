import 'package:big_mosquito_flutter/models/objectbox.g.dart';
import '../models/userModel.dart';

class LocalDatabase{
  Future<UserModel> getUser() async{
    final store = await openStore();
    final box= store.box<UserModel>();

    UserModel user= box.getAll().first;
    store.close();
    return user;
  }

  putUser(UserModel user) async{
    final store = await openStore();
    final box= store.box<UserModel>();
    box.removeAll();
    box.put(user);
    store.close();
  }
}