import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:patterns_bloc/bloc/update_state.dart';
import '../model/post_model.dart';
import '../service/http_service.dart';

class UpdateCubit extends Cubit<UpdateState> {
  UpdateCubit() : super(UpdateInit());

  void apiPostUpdate(Post post) async {
    emit(UpdateLoading());
    final response = await Network.PUT(
        Network.apiUpdate + post.id.toString(), Network.paramsUpdate(post));

    if (response != null) {
      emit(UpdateLoaded(
        isUpdated: true,
      ));
    } else {
      emit(UpdateError(error: 'Could not update a post'));
    }
  }
}
