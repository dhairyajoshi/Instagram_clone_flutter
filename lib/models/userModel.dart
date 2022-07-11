import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class UserModel extends Equatable {
  int id=0;
  String username;
  String first_name;
  String bio;
  String pfp;
  String cpf;
  int posts;
  int likes;
  bool is_staff;

  UserModel(this.username, this.first_name, this.bio, this.pfp, this.cpf,
      this.posts, this.likes, this.is_staff);
  @override
  List<Object?> get props =>
      [username, first_name, bio, pfp, cpf, posts, likes, is_staff];

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      json['username'],
      json['first_name'],
      json['bio'] ?? " ",
      'https://apps-ourspace.herokuapp.com'+json['pfp'],
      'https://apps-ourspace.herokuapp.com'+json['cfp'],
      json['posts'],
      json['likes'],
      json['is_staff']);
}
