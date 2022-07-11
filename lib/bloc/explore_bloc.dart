import 'package:flutter_bloc/flutter_bloc.dart';

import '../Services/database_services.dart';
import 'AppBlock.dart';

class ExploreLoadingState extends AppState {}

class ExploreLoadedState extends AppState {
  final List<String> _posts;

  ExploreLoadedState(this._posts);

  get posts => _posts;
}

class FetchExploreEvent extends AppEvent {}

class ExplorePageBloc extends Bloc<AppEvent, AppState> {
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
