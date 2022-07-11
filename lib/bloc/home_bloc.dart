import 'package:big_mosquito_flutter/bloc/AppBlock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../Services/database_services.dart';
import '../models/postModel.dart';

class HomeLoadingState extends AppState {}

class CreatePostState extends AppState{
  final XFile? image;

  CreatePostState(this.image);
}

class HomeLoadedState extends AppState {
  final List<Post> _posts;
  final List<String> _items = ['camera', 'gallery'];

  HomeLoadedState(this._posts);

  get posts => _posts;
  get items => _items;
}

class FetchHomeEvent extends AppEvent {}

class HomeCreaPostState extends AppState {}

class ChangeHomePostState extends AppEvent {
  String item;

  ChangeHomePostState(this.item);

  @override
  get props => [];
}

class UploadPostEvent extends AppEvent{
}

class HomePageBloc extends Bloc<AppEvent, AppState> {
  List<Post> results = [];
  String caption="";
  XFile? image;
  HomePageBloc() : super(HomeLoadingState()) {
    on<FetchHomeEvent>(
      (event, emit) async {
        results = await DatabaseService().getPosts();

        emit(HomeLoadedState(results));
      },
    );

    on<ChangeHomePostState>(
      (event, emit) async {
        final ImagePicker _picker = ImagePicker();
        
        switch (event.item) {
          case 'camera':
            { 
              image =
                  await _picker.pickImage(source: ImageSource.camera);
            }
            break;
          case 'gallery':
            {
              image =
                  await _picker.pickImage(source: ImageSource.gallery);
            }
            break;
            case 'home':
            {
              emit(HomeLoadedState(results));
            }
            break;
        }
        if(image==null){
          emit(HomeLoadedState(results));
        }
        else { 
          emit(CreatePostState(image));
        }
      },
    );

    on<UploadPostEvent>((event, emit) async{
      String response=await DatabaseService().uploadPost(image!, caption);

      if(response=='Uploaded successfully'){
        add(ChangeHomePostState('home'));
        add(FetchHomeEvent());

      }
    },);

  }

  setCaption(value) => caption=value;
}
 