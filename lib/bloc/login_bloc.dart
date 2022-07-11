import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/auth_services.dart';
import 'AppBlock.dart';

class LoggedOutState extends AppState {}

class LoggedInState extends AppState {}

class LoggingInState extends AppState {}

class CheckLoginEvent extends AppEvent {}

class LoginEvent extends AppEvent {
  String username;
  String password;

  LoginEvent(this.username, this.password);
}

class LogoutEvent extends AppEvent{}

class LoginBloc extends Bloc<AppEvent, AppState> {
  bool loggedIn = false;
  LoginBloc() : super(LoggingInState()) {
    on<CheckLoginEvent>((event, emit) async {
      final pref = await SharedPreferences.getInstance();

      final token = pref.getString('token');

      if (token == null) {
        emit(LoggedOutState());
      } else {
        // emit(LoggedInState());
        if (await AuthServices().checkAuthStatus()) {
          emit(LoggedInState());
        } else {
          emit(LoggedOutState());
        }
      }
    });

    on<LoginEvent>(
      (event, emit) async {
        final login =
            await AuthServices().login(event.username, event.password);

        if (login) {
          emit(LoggedInState());
        } else {
          emit(LoggedOutState());
        }
      },
    );

    on<LogoutEvent>((event, emit) async{
      final pref = await SharedPreferences.getInstance();

      await pref.remove('token');

      emit(LoggedOutState());
    },);
  }
}
