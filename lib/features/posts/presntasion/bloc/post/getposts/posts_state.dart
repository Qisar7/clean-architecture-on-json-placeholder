part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();

  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {}

class PostLoadingState extends PostsState {
  @override
  List<Object> get props => [];
}

class PostLodeadState extends PostsState {
  final List<EntityPost> post;

  const PostLodeadState({required this.post});

  @override
  List<Object> get props => [post];
}

class PostErrorState extends PostsState {
  final String massage;

  const PostErrorState({required this.massage});
  @override
  List<Object> get props => [massage];
}
