import 'features/posts/data/datasorces/comment/comment_remote_datasource.dart';
import 'features/posts/data/repository/comment_repository_impl.dart';
import 'features/posts/domain/repository/comment_repository.dart';
import 'features/posts/domain/usecases/comments/get_all_comment.dart';
import 'features/posts/domain/usecases/comments/get_post_comment.dart';
import 'features/posts/presntasion/bloc/comment/comment_bloc.dart';

import 'core/network/network_check.dart';
import 'features/posts/data/datasorces/posts/post_local_data_source.dart';
import 'features/posts/data/datasorces/posts/post_remote_data_source.dart';
import 'features/posts/data/repository/post_repository_impl..dart';
import 'features/posts/domain/repository/post_repository.dart';
import 'features/posts/domain/usecases/posts/add_post.dart';
import 'features/posts/domain/usecases/posts/delete_post.dart';
import 'features/posts/domain/usecases/posts/get_all_post.dart';
import 'features/posts/domain/usecases/posts/update_post.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/posts/presntasion/bloc/post/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'features/posts/presntasion/bloc/post/getposts/posts_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! featares posts

//bloc

  // posts

  sl.registerFactory(() => PostsBloc(getAllPost: sl.call()));

  sl.registerFactory(
    () => AddDeleteUpdatePostBloc(
      addPost: sl.call(),
      deletePost: sl.call(),
      upadatePost: sl.call(),
    ),
  );
  // comment
  sl.registerFactory(() => CommentBloc(
        getAllComment: sl(),
        getPostComment: sl(),
      ));

//UseCase

  sl.registerLazySingleton(() => GetAllPostUseCase(sl()));
  sl.registerLazySingleton(() => AddPostUseCase(sl()));
  sl.registerLazySingleton(() => UpadatePostUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));
  sl.registerLazySingleton(() => GetAllCommentUseCase(sl()));
  sl.registerLazySingleton(() => GetPostCommentUseCase(sl()));

// Repository

  sl.registerLazySingleton<PostRepository>(() => PostRepositoryimplement(
        remoteDataSource: sl(),
        localDataSource: sl(),
        internetChecker: sl(),
      ));
  sl.registerLazySingleton<CommentRepository>(() => CommentRepositoryimplement(
        remoteDataSourceimpl: sl(),
        internetChecker: sl(),
      ));

//DataSource

  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSoruceImpl());

  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceimpl(sharedPreferences: sl()));

  sl.registerLazySingleton<CommentRemoteDataSource>(
      () => CommentRemoteDataSourceimpl());
  // sl.registerLazySingleton<CommentRemoteDataSource>(
  //     () => CommentRemoteDataSourceimpl());

//! core

  sl.registerLazySingleton<InternetChecker>(() => InternetCheckerimpl(sl()));

//! External

  final SharedPreferences sharedpref = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedpref);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
