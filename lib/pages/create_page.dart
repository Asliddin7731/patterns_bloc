import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/create_state.dart';
import '../bloc/create_cubit.dart';
import '../views/view_of_create.dart';

class CreatePage extends StatefulWidget {
  final int? postId;
  final String? title;
  final String? body;
  const CreatePage(
      {super.key,this.postId, this.title, this.body});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  _finish(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context, "result");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: BlocProvider(
        create: (context) => CreateCubit(),
        child: BlocBuilder<CreateCubit, CreateState>(
          builder: (BuildContext context, CreateState state) {
            if (state is CreateLoading) {
              return viewOfCreate(context,titleController, bodyController, true);
            }

            if (state is CreateLoaded) {
              // finish
              _finish(context);
            }
            return viewOfCreate(context, titleController, bodyController,  false);
          },
        ),
      )
    );
  }

}
