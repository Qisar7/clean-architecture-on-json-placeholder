part of 'add_delete_update_post_bloc.dart';

abstract class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();

  @override
  List<Object> get props => [];
}

class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

class LoadingAddDeteteUpdatePostState extends AddDeleteUpdatePostState {}

class ErrorAddDeteteUpdatePostMassageState extends AddDeleteUpdatePostState {
  final String message;

  const ErrorAddDeteteUpdatePostMassageState({required this.message});

  @override
  List<Object> get props => [message];
}

class SuccessAddDeteteUpdatePostMassageState extends AddDeleteUpdatePostState {
  final String message;

  const SuccessAddDeteteUpdatePostMassageState({required this.message});

  @override
  List<Object> get props => [message];
}
