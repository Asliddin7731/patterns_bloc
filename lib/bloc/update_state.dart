
import 'package:equatable/equatable.dart';

abstract class UpdateState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateInit extends UpdateState {}

class UpdateLoading extends UpdateState {}

class UpdateLoaded extends UpdateState {
  final bool? isUpdated;

  UpdateLoaded({this.isUpdated});
}

class UpdateError extends UpdateState {
  final String? error;

  UpdateError({this.error});
}
