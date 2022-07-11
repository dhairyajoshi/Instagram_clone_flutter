import 'package:big_mosquito_flutter/Services/auth_services.dart';
import 'package:big_mosquito_flutter/bloc/login_bloc.dart';
import 'package:big_mosquito_flutter/models/objectbox.g.dart';
import 'package:big_mosquito_flutter/models/postModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Services/database_services.dart';
import '../Services/localDbServices.dart';
import '../models/userModel.dart';
import 'AppBlock.dart';

class PostLoadingState extends AppState {}

class PostLoadedState extends AppState {
  final UserModel user;
  final List<Post> _posts;

  PostLoadedState(this.user, this._posts);

  List<Post> get posts => _posts;
}

class LogoutTriggerEvent extends AppEvent{}

class FetchPostEvent extends AppEvent {}

class ProfilePageBloc extends Bloc<AppEvent, AppState> {
  ProfilePageBloc() : super(PostLoadingState()) {
    on<FetchPostEvent>(
      (event, emit) async {
        List<Post> result = [];

        UserModel user = await LocalDatabase().getUser();
        result = await DatabaseService().getUserPosts();
        emit(PostLoadedState(user, result));
        await AuthServices().checkAuthStatus();
        user = await LocalDatabase().getUser();
        emit(PostLoadedState(user, result)); 
      },
    );

    on<LogoutTriggerEvent>((event, emit) {
      LoginBloc().add(LogoutEvent());
    },);
  }
}
 