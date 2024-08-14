
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/list_post_state.dart';
import 'package:patterns_bloc/model/post_model.dart';
import 'package:patterns_bloc/pages/update_page.dart';
import 'package:patterns_bloc/service/log_service.dart';
import '../pages/create_page.dart';
import '../service/http_service.dart';

class ListPostCubit extends Cubit<ListPostState>{
  ListPostCubit() : super(ListPostInit());

  Future<void> apiPostList() async{
    emit(ListPostLoading());
    final response = await Network.GET(Network.apiList, Network.paramsEmpty());

    if(response != null){
      emit(ListPostLoaded(posts: Network.parsePostList(response)));
    }else{
      emit(ListPostError(error: 'Could not fetch posts'));
    }
  }

  void apiPostDelete (Post post) async{
    emit(ListPostLoading());
    final response = await Network.DEl(
        Network.apiDelete + post.id.toString(), Network.paramsEmpty());


    if(response != null){
      apiPostList();
    }else{
      emit(ListPostError(error: 'Could not delete a post'));
    }
  }

  void callCreatePage(BuildContext context) async {
    var results = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const CreatePage()));
    if (results != null) {
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }

  void callUpdatePage(BuildContext context, Post post) async {
    print(post.toJson());
    var results = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => UpdatePage(post: post)));
    if (results != null) {
      // BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }
}