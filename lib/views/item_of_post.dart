
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../bloc/list_post_cubit.dart';
import '../model/post_model.dart';

Widget itemOfPost(BuildContext context, Post post) {
  return Slidable(
    startActionPane: ActionPane(
      dragDismissible: false,
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {},
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            BlocProvider.of<ListPostCubit>(context).callUpdatePage(context, post);
          },
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: 'Update',
        )
      ],
    ),
    endActionPane: ActionPane(
      dragDismissible: false,
      motion: const ScrollMotion(),
      dismissible: DismissiblePane(
        onDismissed: () {},
      ),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            BlocProvider.of<ListPostCubit>(context).apiPostDelete(post);
          },
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        )
      ],
    ),
    child: Container(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.title!.toUpperCase()),
          const SizedBox(height: 5),
          Text(post.body!),
        ],
      ),
    ),
  );
}