
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/create_state.dart';
import 'package:patterns_bloc/service/log_service.dart';
import '../model/post_model.dart';
import '../service/http_service.dart';

class CreateCubit extends Cubit<CreateState> {
  CreateCubit() : super(CreateInit());


  void apiPostCreate(Post post)async {
    final response = await Network.POST(Network.apiCreate, Network.paramsCreate(post));
    emit(CreateLoading());

    if (response != null) {
      LogService.e(response.toString());
      emit(CreateLoaded(isCreated: true));
    } else {
      emit(CreateError(error: "Couldn't create post"));
    }
  }
}