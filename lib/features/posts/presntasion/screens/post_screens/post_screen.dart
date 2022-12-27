import 'post_add_update_screen.dart';

import '../../../../../core/widgets/loadingwidget.dart';

import '../../bloc/post/getposts/posts_bloc.dart';
import '../../widgets/post/message_widget.dart';
import '../../widgets/post/post_list.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
        centerTitle: true,
      ),
      body: _builBody(),
      floatingActionButton: _buildflotingwidget(context),
    );
  }

  Widget _builBody() {
    return BlocBuilder<PostsBloc, PostsState>(
      builder: (context, state) {
        if (state is PostLoadingState) {
          return LoadingWidget();
        } else if (state is PostLodeadState) {
          return RefreshIndicator(
            child: PostListwidget(post: state.post),
            onRefresh: () => _onrefresh(context),
          );
        } else if (state is PostErrorState) {
          return MessageWidget(message: state.massage);
        } else if (state is PostsInitial) {
          return LoadingWidget();
        } else {
          return _buildinitialstate();
        }
      },
    );
  }

  Future<void> _onrefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshScreenEvent());
  }

  Widget _buildflotingwidget(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PostAddUpdateScreen(
              isupdateing: false,
            ),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }

  Widget _buildinitialstate() {
    return const Center(
      child: Text(
        'NO DATA !',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
