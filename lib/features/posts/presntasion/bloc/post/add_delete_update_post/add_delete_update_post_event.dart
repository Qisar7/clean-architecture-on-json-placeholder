part of 'add_delete_update_post_bloc.dart';

abstract class AddDeleteUpdatePostEvent extends Equatable {
  const AddDeleteUpdatePostEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends AddDeleteUpdatePostEvent {
  final EntityPost post;

  const AddPostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class DeletePostEvent extends AddDeleteUpdatePostEvent {
  final int postid;

  const DeletePostEvent({required this.postid});

  @override
  List<Object> get props => [postid];
}

class UpdatePostEvent extends AddDeleteUpdatePostEvent {
  final EntityPost post;

  const UpdatePostEvent({required this.post});

  @override
  List<Object> get props => [post];
}
