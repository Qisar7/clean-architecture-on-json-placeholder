import '../../../../../core/error/failure.dart';
import '../../entity/comment.dart';
import '../../repository/comment_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllCommentUseCase {
  final CommentRepository commentRepository;

  GetAllCommentUseCase(this.commentRepository);

  Future<Either<Failure, List<EntityComment>>> call() async {
    return await commentRepository.getallcomment();
  }
}
