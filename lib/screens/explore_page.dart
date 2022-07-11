// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:big_mosquito_flutter/bloc/AppBlock.dart';
import 'package:big_mosquito_flutter/Services/database_services.dart';
import 'package:big_mosquito_flutter/bloc/explore_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => ExplorePageBloc()..add(FetchExploreEvent())),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              TextField(),
              BlocBuilder<ExplorePageBloc, AppState>(
                builder: (context, state) {
                  if (state is ExploreLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ExploreLoadedState) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: GridView.builder(
                          itemCount: state.posts.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 1 / 1,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2),
                            itemBuilder: (context, index) {
                              return Image.network(state.posts[index]);
                            }));
                  }
                  return Center(child: CircularProgressIndicator(),);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
