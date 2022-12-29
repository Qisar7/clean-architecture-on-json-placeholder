import '../datasorces/comment/comment_local_datasource.dart';

import '../../../../core/error/exceptions.dart';
import '../datasorces/comment/comment_remote_datasource.dart';
import '../model/comment_model.dart';
import '../../domain/entity/comment.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/comment_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/network_check.dart';

class CommentRepositoryimplement extends CommentRepository {
  // final CommmentLocaldataSoruceimpl commmentLocaldataSoruceimpl; TODO COOMING SOON
  final CommentRemoteDataSourceimpl remoteDataSourceimpl;
  final InternetChecker internetChecker;

  CommentRepositoryimplement({
    required this.remoteDataSourceimpl,
    required this.internetChecker,
    // required this.commmentLocaldataSoruceimpl,
  });

  @override
  Future<Either<Failure, List<EntityComment>>> getallcomment() async {
    return await _checkinternetandretrun(remoteDataSourceimpl.getallcomment());
  }

  @override
  Future<Either<Failure, List<EntityComment>>> getpostcomment(
      int postid) async {
    if (await internetChecker.IsDiviceConnected) {
      try {
        final remotedata = await remoteDataSourceimpl.getpostcomment(postid);
        return Right(remotedata);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }

    // return await _checkinternetandretrun(
    //     remoteDataSourceimpl.getpostcomment(postid));
  }

  Future<Either<Failure, List<EntityComment>>> _checkinternetandretrun(
      Future<List<CommentModel>> comment) async {
    if (await internetChecker.IsDiviceConnected) {
      try {
        final remotecomment = await comment;
        return Right(remotecomment);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
