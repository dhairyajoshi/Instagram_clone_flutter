import 'package:big_mosquito_flutter/bloc/AppBlock.dart';
import 'package:big_mosquito_flutter/bloc/login_bloc.dart';
import 'package:big_mosquito_flutter/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: BlocProvider(
        create: (context) => LoginBloc()..add(CheckLoginEvent()),
        child: BlocBuilder<LoginBloc, AppState>(
          builder: (context, state) {
            if (state is LoggedInState) {
              return Wrapper(); 
            }
            if (state is LoggedOutState) {
              print('yes');
              TextEditingController nameController = TextEditingController();
              TextEditingController passwordController =
                  TextEditingController();
              return BlocProvider(
                create: (context) => LoginBloc(),
                child: Scaffold(
                  body: SafeArea(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: ListView(
                              shrinkWrap: true,
                              children: <Widget>[
                                Container( 
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(10),
                                    child: const Text(
                                      '𝓘𝓷𝓼𝓽𝓪𝓰𝓻𝓪𝓶',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 255, 255, 255),
                                          fontWeight: FontWeight.w500,
                                          fontSize: 30),
                                    )),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: TextField(
                                    controller: nameController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'User Name',
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  child: TextField(
                                    obscureText: true,
                                    controller: passwordController,
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Password',
                                    ),
                                  ),
                                ),
                                Container(
                                    height: 50,
                                    margin: EdgeInsets.only(top: 20),
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: ElevatedButton(
                                      child: const Text('Login'),
                                      onPressed: () {
                                        BlocProvider.of<LoginBloc>(context).add(
                                            LoginEvent(nameController.text,
                                                passwordController.text));
                                      },
                                    )),
                                TextButton(
                                  onPressed: () {
                                    //forgot password screen
                                  },
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    const Text('Don\'t have account?'),
                                    TextButton(
                                      child: const Text(
                                        'Sign in',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      onPressed: () {
                                        //signup screen
                                      },
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ],
                            ),
                          ))),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
