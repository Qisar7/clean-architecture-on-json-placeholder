import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_check.dart';
import '../../domain/entity/post.dart';
import '../../domain/repository/post_repository.dart';
import '../datasorces/posts/post_local_data_source.dart';
import '../datasorces/posts/post_remote_data_source.dart';
import '../model/post_model.dart';

typedef AddorDeleteorUpdatePost = Future<Unit> Function();

class PostRepositoryimplement implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final InternetChecker internetChecker;

  PostRepositoryimplement({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.internetChecker,
  });

  @override
  Future<Either<Failure, List<EntityPost>>> getallpost() async {
    if (await internetChecker.IsDiviceConnected) {
      try {
        final remotepost = await remoteDataSource.getallpost();
        localDataSource.cachedPost(remotepost);
        return Right(remotepost);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localpost = await localDataSource.getCachedPost();
        return Right(localpost);
      } on EmptyDataException {
        return Left(EmptyDataFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(EntityPost post) async {
    final PostModel postModel = PostModel(title: post.title, body: post.body);

    return await _getmassage(() {
      return remoteDataSource.addpost(postModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postid) async {
    return await _getmassage(() {
      return remoteDataSource.deletepost(postid);
    });
  }

  @override
  Future<Either<Failure, Unit>> updatePost(EntityPost post) async {
    final PostModel postModel =
        PostModel(id: post.id, title: post.title, body: post.body);

    return await _getmassage(() {
      return remoteDataSource.updatepost(postModel);
    });
  }

  Future<Either<Failure, Unit>> _getmassage(
      AddorDeleteorUpdatePost service) async {
    if (await internetChecker.IsDiviceConnected) {
      try {
        await service();
        return const Right(unit);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
