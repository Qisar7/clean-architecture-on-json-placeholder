import '../../../../core/error/failure.dart';
import '../entity/comment.dart';
import 'package:dartz/dartz.dart';

abstract class CommentRepository {
  Future<Either<Failure, List<EntityComment>>> getallcomment();
  Future<Either<Failure, List<EntityComment>>> getpostcomment(int postid);
}
