part of 'comment_bloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {}

class CommentLoadingState extends CommentState {}

class CommentLoadedSate extends CommentState {
  final List<EntityComment> comment;

  const CommentLoadedSate({required this.comment});

  @override
  List<Object> get props => [comment];
}

class CommentErrorSate extends CommentState {
  final String massage;

  const CommentErrorSate({required this.massage});

  @override
  List<Object> get props => [massage];
}
