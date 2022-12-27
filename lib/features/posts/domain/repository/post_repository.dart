import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/post.dart';

abstract class PostRepository {
  Future<Either<Failure, List<EntityPost>>> getallpost();
  Future<Either<Failure, Unit>> deletePost(int id);
  Future<Either<Failure, Unit>> updatePost(EntityPost post);
  Future<Either<Failure, Unit>> addPost(EntityPost post);
}
