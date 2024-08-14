import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/update_cubit.dart';
import 'package:patterns_bloc/bloc/update_state.dart';
import 'package:patterns_bloc/views/view_of_update.dart';
import '../model/post_model.dart';

class UpdatePage extends StatefulWidget {
  Post? post;

  UpdatePage({Key? key, this.post}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.post!.title!;
    bodyController.text = widget.post!.body!;
    super.initState();
  }

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");

    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UpdateCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Update'),
          ),
          backgroundColor: Colors.white.withOpacity(0.9),
          body: BlocBuilder<UpdateCubit, UpdateState>(
            builder: (BuildContext context, UpdateState state) {
              if (state is UpdateLoading) {

                String title = titleController.text.toString();
                String body = bodyController.text.toString();
              Post post = Post(
                  id: widget.post!.id,
                  title: title,
                  body: body,
                  userId: widget.post!.userId);

                return viewOfUpdate(context,titleController, bodyController, post,  true);
              }

              if (state is UpdateLoaded) {
                _finish(context);
              }
              return viewOfUpdate(context, titleController, bodyController, widget.post!,   false);
            },
          ),
        )
    );
  }
}

