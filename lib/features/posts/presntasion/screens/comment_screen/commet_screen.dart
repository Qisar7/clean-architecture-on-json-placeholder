import '../../../../../core/widgets/loadingwidget.dart';
import '../../../domain/entity/comment.dart';
import '../../bloc/comment/comment_bloc.dart';
import '../../widgets/post/message_widget.dart';
import '../../widgets/post_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentScreen extends StatefulWidget {
  final int postid;

  const CommentScreen({super.key, required this.postid});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized();
    BlocProvider.of<CommentBloc>(context)
        .add(GetPostCommentsEvent(postid: widget.postid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("post comment"),
      ),
      body: _buidlcommentbody(),
    );
  }

  Widget _buidlcommentbody() {
    return BlocBuilder<CommentBloc, CommentState>(
      builder: (context, state) {
        if (state is CommentLoadingState) {
          return LoadingWidget();
        } else if (state is CommentLoadedSate) {
          return Postcomment(
            comment: state.comment,
          );
        } else if (state is CommentErrorSate) {
          return MessageWidget(message: state.massage);
        } else {
          return LoadingWidget();
        }
      },
    );
  }
}
