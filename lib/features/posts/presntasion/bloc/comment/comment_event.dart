part of 'comment_bloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object> get props => [];
}

class GetAllCommentEvent extends CommentEvent {}

class GetPostCommentsEvent extends CommentEvent {
  final int postid;

  const GetPostCommentsEvent({required this.postid});

  @override
  List<Object> get props => [postid];
}

class RefreshCommentScreenEvent extends CommentEvent {}
