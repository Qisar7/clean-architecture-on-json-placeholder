import '../../../../../core/util/snakbar_m.dart';
import '../../../../../core/widgets/loadingwidget.dart';
import '../../../domain/entity/post.dart';
import 'post_screen.dart';
import '../../widgets/add_delete_update/form_wodget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/post/add_delete_update_post/add_delete_update_post_bloc.dart';

class PostAddUpdateScreen extends StatelessWidget {
  final EntityPost? post;
  final bool isupdateing;

  const PostAddUpdateScreen({super.key, this.post, required this.isupdateing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildpostupdateaddbody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(
        isupdateing ? 'update post' : ' add post',
        style: const TextStyle(fontSize: 18),
      ),
      centerTitle: true,
    );
  }

  Widget _buildpostupdateaddbody() {
    return BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
      listener: (context, state) {
        if (state is ErrorAddDeteteUpdatePostMassageState) {
          MySnakBar.errorsnakbarmessage(state.message, context);
        } else if (state is SuccessAddDeteteUpdatePostMassageState) {
          MySnakBar.successsnakbarmessage(state.message, context);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (_) => PostScreen(),
              ),
              (route) => false);
        }
      },
      builder: (context, state) {
        if (state is LoadingAddDeteteUpdatePostState) {
          return LoadingWidget();
        } else {
          return Formwidget(
            isupdate: isupdateing,
            post: post,
          );
        }
      },
    );
  }
}
