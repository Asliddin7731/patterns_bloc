
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/update_cubit.dart';
import '../model/post_model.dart';

Widget viewOfUpdate(BuildContext context, TextEditingController titleController,
    TextEditingController bodyController, Post post,  bool isLoading) {

  isLoading
      ? const Center(
    child: CircularProgressIndicator(),
  )
      : const SizedBox.shrink();

  return Stack(
    children: [
      Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Column(
                children: [
                  const SizedBox(height: 40),
                  TextField(
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w500),
                    controller: titleController,
                    cursorColor: Colors.black54,
                    textAlignVertical: TextAlignVertical.top,
                    textAlign: TextAlign.start,
                    maxLines: 5,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        contentPadding: const EdgeInsets.all(5),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(width: 2, color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 2, color: Colors.black54),
                        ),
                        alignLabelWithHint: true,
                        labelText: 'Title',
                        labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                        ))),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w500),
                    controller: bodyController,
                    cursorColor: Colors.black54,
                    textAlignVertical: TextAlignVertical.top,
                    textAlign: TextAlign.start,
                    maxLines: 5,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.8),
                        contentPadding: const EdgeInsets.all(5),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(width: 2, color: Colors.grey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide:
                              BorderSide(width: 2, color: Colors.black54),
                        ),
                        alignLabelWithHint: true,
                        labelText: 'Body',
                        labelStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                        ))),
                  ),
                  const SizedBox(height: 100),
                  MaterialButton(
                    color: Colors.blueAccent.shade100,
                    shape: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blueAccent.shade200),
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    minWidth: 200,
                    onPressed: () {
                      String title = titleController.text.toString().trim();
                      String body = bodyController.text.toString().trim();
                      if(title.isNotEmpty && body.isNotEmpty){
                        BlocProvider.of<UpdateCubit>(context).apiPostUpdate(post);
                      }
                    },
                    child: const Text('Update Post'),
                  ),
                ],
              ),
            ],
          )),
      isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const SizedBox.shrink(),
    ],
  );
}


