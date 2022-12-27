import '../../entity/post.dart';
import '../../repository/post_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';

class AddPostUseCase {
  final PostRepository postRepository;
  AddPostUseCase(this.postRepository);

  Future<Either<Failure, Unit>> call(EntityPost post) async {
    return await postRepository.addPost(post);
  }
}
