import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../entity/post.dart';
import '../../repository/post_repository.dart';

class UpadatePostUseCase {
  final PostRepository postRepository;

  UpadatePostUseCase(this.postRepository);

  Future<Either<Failure, Unit>> call({required EntityPost post}) async {
    return await postRepository.updatePost(post);
  }
}
