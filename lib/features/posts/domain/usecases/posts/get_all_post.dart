import '../../repository/post_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';
import '../../entity/post.dart';

class GetAllPostUseCase {
  final PostRepository postRepository;

  GetAllPostUseCase(this.postRepository);

  Future<Either<Failure, List<EntityPost>>> call() async {
    return await postRepository.getallpost();
  }
}
