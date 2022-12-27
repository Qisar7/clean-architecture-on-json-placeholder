import 'package:bloc/bloc.dart';
import '../../../../../core/error/error_cases.dart';
import '../../../domain/entity/comment.dart';
import '../../../domain/usecases/comments/get_all_comment.dart';
import '../../../domain/usecases/comments/get_post_comment.dart';
import 'package:equatable/equatable.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final GetAllCommentUseCase getAllComment;
  final GetPostCommentUseCase getPostComment;

  CommentBloc({required this.getAllComment, required this.getPostComment})
      : super(CommentInitial()) {
    on<CommentEvent>((event, emit) async {
      if (event is GetAllCommentEvent) {
        emit(CommentLoadingState());

        final getallcommentorfailer = await getAllComment();
        getallcommentorfailer.fold(
          (failer) => {
            emit(
              CommentErrorSate(massage: errormessage(failer)),
            ), // // mean error or left or false in funcinoal progrmmaing that define by dartz package
          },
          (comment) => {
            emit(
              CommentLoadedSate(comment: comment),
            ) // mean ture or right or noerror in funcinoal progrmmaing that define by dartz package
          },
        );
      } else if (event is GetPostCommentsEvent) {
        emit(CommentLoadingState());

        final getpostcommentorfailer =
            await getPostComment(postid: event.postid);

        getpostcommentorfailer.fold(
          (failer) => {
            emit(
              CommentErrorSate(
                massage: errormessage(failer),
              ),
            )
          },
          (postcomment) => {
            emit(
              CommentLoadedSate(comment: postcomment),
            )
          },
        );
      }
    });
  }
}
