import '../../../../../core/error/failure.dart';
import '../../entity/comment.dart';
import '../../repository/comment_repository.dart';
import 'package:dartz/dartz.dart';

class GetPostCommentUseCase {
  final CommentRepository commentRepository;

  GetPostCommentUseCase(this.commentRepository);

  Future<Either<Failure, List<EntityComment>>> call(
      {required int postid}) async {
    return await commentRepository.getpostcomment(postid);
  }
}
