import 'package:big_mosquito_flutter/Services/database_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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

class PostLoadingState extends AppState {}

class ExploreLoadingState extends AppState{}

class HomeLoadingState extends AppState{}

class HomeLoadedState extends AppState{
  List<String> _posts;

  HomeLoadedState(this._posts);

  get posts => _posts;
}

class ExploreLoadedState extends AppState{
  List<String> _posts;

  ExploreLoadedState(this._posts);

  get posts => _posts;
}

class PostLoadedState extends AppState {
  List<String> _posts;

  PostLoadedState(this._posts);

  List<String> get posts => _posts;
}

class AppEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeScreenEvent extends AppEvent {
  int _screen;

  ChangeScreenEvent(this._screen);

  @override
  List<Object> get props => [_screen];
}

class FetchPostEvent extends AppEvent {}

class FetchExploreEvent extends AppEvent{}

class FetchHomeEvent extends AppEvent{}

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

class ProfilePageBloc extends Bloc<AppEvent,AppState> {
  ProfilePageBloc() : super(PostLoadingState()) {
    on<FetchPostEvent>(
      (event, emit) async {
        emit(PostLoadingState());

        final _posts = await DatabaseService().getPhotos();

        emit(PostLoadedState(_posts));
      },
    );
  }
}

class ExplorePageBloc extends Bloc<AppEvent,AppState> {
  ExplorePageBloc() : super(ExploreLoadingState()) {
    on<FetchExploreEvent>(
      (event, emit) async {
        emit(ExploreLoadingState());

        final _posts = await DatabaseService().getPhotos();

        emit(ExploreLoadedState(_posts));
      },
    );
  }
}

class HomePageBloc extends Bloc<AppEvent,AppState>{
  List<String> results=[];
  HomePageBloc() : super(HomeLoadingState()){

    on<FetchHomeEvent>((event, emit) async {
    
      results= await DatabaseService().getPhotos();

      emit(HomeLoadedState(results));

    },);

  }
  
}