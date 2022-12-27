import 'package:bloc/bloc.dart';
import '../../../../../../core/error/error_cases.dart';
import '../../../../../../core/error/failure.dart';
import '../../../../domain/entity/post.dart';
import '../../../../domain/usecases/posts/get_all_post.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  //first call the use cases
  final GetAllPostUseCase getAllPost;

  PostsBloc({required this.getAllPost}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      final postsorfailure = await getAllPost();

      if (event is GetAllpostEvent) {
        emit(PostLoadingState());
        emit(_postorfailuer(postsorfailure));
      } else if (event is RefreshScreenEvent) {
        emit(PostLoadingState());
        emit(_postorfailuer(postsorfailure));
      }
    });
  }

  PostsState _postorfailuer(Either<Failure, List<EntityPost>> either) {
    return either.fold(
      (failuer) {
        return PostErrorState(massage: errormessage(failuer));
      },
      (posts) {
        return PostLodeadState(post: posts);
      },
    );
  }

  // String _errormassge(Failure failure) {
  //   switch (failure.runtimeType) {
  //     case OfflineFailure:
  //       return OFFLINE_FAILURE_MESSAGE;

  //     case EmptyDataFailure:
  //       return EMPTY_DATA_FAILURE_MESSAGE;

  //     case ServerFailure:
  //       return SERVER_FAILURE_MESSAGE;

  //     default:
  //       return UNKNOWN_FAILURE_MESSAHE;
  //   }
  // }
}
