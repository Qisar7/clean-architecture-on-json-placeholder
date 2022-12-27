import 'package:bloc/bloc.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../../../../core/error/error_cases.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../../../core/string/success.dart';
import '../../../../domain/entity/post.dart';
import '../../../../domain/usecases/posts/add_post.dart';
import '../../../../domain/usecases/posts/delete_post.dart';
import '../../../../domain/usecases/posts/update_post.dart';

part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddPostUseCase addPost;
  final DeletePostUseCase deletePost;
  final UpadatePostUseCase upadatePost;

  AddDeleteUpdatePostBloc({
    required this.addPost,
    required this.deletePost,
    required this.upadatePost,
  }) : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingAddDeteteUpdatePostState());
        final addOrFailure = await addPost(event.post);
        emit(_eithirdonemessageorfailure(addOrFailure, ADD_SUCCESS_MESSAGE));
      } else if (event is UpdatePostEvent) {
        emit(LoadingAddDeteteUpdatePostState());
        final updatedorfailure = await upadatePost(post: event.post);
        emit(_eithirdonemessageorfailure(
            updatedorfailure, UPDATE_SUCCESS_MESSAGE));
      } else if (event is DeletePostEvent) {
        emit(LoadingAddDeteteUpdatePostState());
        final deleteorfailure = await deletePost(event.postid);
        emit(_eithirdonemessageorfailure(
            deleteorfailure, DELETE_SUCCESS_MESSAGE));
      }
    });
  }

  AddDeleteUpdatePostState _eithirdonemessageorfailure(
      Either<Failure, Unit> doneOrFailure, String message) {
    return doneOrFailure.fold(
      (failure) {
        return ErrorAddDeteteUpdatePostMassageState(
            message: errormessage(failure));
      },
      (success) {
        return SuccessAddDeteteUpdatePostMassageState(message: message);
      },
    );
  }
}
