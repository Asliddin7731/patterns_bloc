
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/list_post_cubit.dart';
import '../model/post_model.dart';
import 'item_of_post.dart';

Widget viewOfHome(BuildContext context, List<Post> items, bool isLoading) {
  return Stack(
    children: [
      RefreshIndicator.adaptive(
        onRefresh: () async {
          HapticFeedback.vibrate();
          await BlocProvider.of<ListPostCubit>(context).apiPostList();
        },
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, index) {
            Post post = items[index];
            return itemOfPost(ctx, post);
          },
        ),
      ),
      isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const SizedBox.shrink(),
    ],
  );
}