import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/apptheme/app_theme.dart';
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
          create: (_) => di.sl<CommentBloc>(),
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
