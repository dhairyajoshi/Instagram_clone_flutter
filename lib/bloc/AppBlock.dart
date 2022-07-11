// ignore_for_file: must_be_immutable

import 'package:big_mosquito_flutter/Services/auth_services.dart';
import 'package:big_mosquito_flutter/Services/database_services.dart';
import 'package:big_mosquito_flutter/Services/localDbServices.dart';
import 'package:big_mosquito_flutter/models/postModel.dart';
import 'package:big_mosquito_flutter/models/objectbox.g.dart';
import 'package:big_mosquito_flutter/models/userModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomePageState extends AppState {}

class NotificationPageState extends AppState {}

class ProfilePageState extends AppState {}

class ExplorePageState extends AppState {}

class ReelsPageState extends AppState {}

class AppEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeScreenEvent extends AppEvent {
  final int _screen;

  ChangeScreenEvent(this._screen);

  @override
  List<Object> get props => [_screen];
}

class WrapperBloc extends Bloc<AppEvent, AppState> {
  WrapperBloc() : super(HomePageState()) {
    on<ChangeScreenEvent>((event, emit) {
      switch (event._screen) {
        case 0:
          {
            emit(HomePageState());
          }
          break;
        case 1:
          {
            emit(ExplorePageState());
          }
          break;
        case 2:
          {
            emit(ReelsPageState());
          }
          break;
        case 3:
          {
            emit(NotificationPageState());
          }
          break;
        case 4:
          {
            emit(ProfilePageState());
          }
          break;
        default:
          {
            emit(HomePageState());
          }
      }
    });
  }
}
