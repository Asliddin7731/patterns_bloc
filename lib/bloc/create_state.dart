
import 'package:equatable/equatable.dart';

abstract class CreateState extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateInit extends CreateState {}

class CreateLoading extends CreateState {}

class CreateLoaded extends CreateState {
  final bool? isCreated;

  CreateLoaded({this.isCreated});
}

class CreateError extends CreateState {
  final String? error;

  CreateError({this.error});
}

