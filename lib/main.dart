import 'package:clean_arc/core/network/network_check.dart';
import 'package:clean_arc/features/posts/data/datasorces/comment/comment_remote_datasource.dart';
import 'package:clean_arc/features/posts/data/repository/comment_repository_impl.dart';
import 'package:clean_arc/features/posts/domain/usecases/comments/get_all_comment.dart';
import 'package:clean_arc/features/posts/presntasion/screens/comment_screen/commet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/apptheme/app_theme.dart';
import 'features/posts/domain/usecases/comments/get_post_comment.dart';
import 'features/posts/presntasion/bloc/comment/comment_bloc.dart';
import 'features/posts/presntasion/bloc/post/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'features/posts/presntasion/bloc/post/getposts/posts_bloc.dart';
import 'features/posts/presntasion/screens/post_screens/post_screen.dart';
import 'injector_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<PostsBloc>()..add(GetAllpostEvent()),
        ),
        BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>()),
        BlocProvider(
          create: (_) => CommentBloc(
            getAllComment: GetAllCommentUseCase(
              CommentRepositoryimplement(
                remoteDataSourceimpl: CommentRemoteDataSourceimpl(),
                internetChecker: InternetCheckerimpl(
                  InternetConnectionChecker(),
                ),
              ),
            ),
            getPostComment: GetPostCommentUseCase(
              CommentRepositoryimplement(
                remoteDataSourceimpl: CommentRemoteDataSourceimpl(),
                internetChecker: InternetCheckerimpl(
                  InternetConnectionChecker(),
                ),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Posts App',
        debugShowCheckedModeBanner: false,
        home: PostScreen(),
        theme: Themedata.themeData,
      ),
    );
  }
}
