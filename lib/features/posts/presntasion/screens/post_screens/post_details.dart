import 'package:clean_arc/core/util/snakbar_m.dart';
import 'package:clean_arc/core/widgets/loadingwidget.dart';
import 'package:clean_arc/features/posts/presntasion/screens/post_screens/post_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/post.dart';
import '../../bloc/post/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'post_add_update_screen.dart';
import '../../widgets/add_delete_update/form_wodget.dart';
import "package:flutter/material.dart";

class PostDetails extends StatelessWidget {
  final EntityPost post;

  PostDetails({Key? key, required this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' post details'),
        centerTitle: true,
      ),
      body: _builddetailsbody(context),
    );
  }

  Widget _builddetailsbody(BuildContext context) {
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
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    post.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  child: Text(
                    post.body,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      wordSpacing: 2,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildbutton(context),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildbutton(BuildContext ctx) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              ctx,
              MaterialPageRoute(
                  builder: (_) => PostAddUpdateScreen(
                        isupdateing: true,
                        post: post,
                      )),
            );
          },
          child: Row(
            children: const [
              Text('Edit'),
              Icon(Icons.edit),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print('${post.id}');
            BlocProvider.of<AddDeleteUpdatePostBloc>(ctx)
                .add(DeletePostEvent(postid: post.id!));
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.redAccent,
          ),
          child: Row(
            children: const [
              Text('Delete'),
              Icon(Icons.delete),
            ],
          ),
        ),
      ],
    );
  }
}
