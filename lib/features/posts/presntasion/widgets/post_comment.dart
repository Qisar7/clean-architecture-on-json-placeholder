import '../../domain/entity/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Postcomment extends StatelessWidget {
  final List<EntityComment> comment;

  const Postcomment({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: comment.length,
      itemBuilder: (ctx, i) {
        return _ListofComment(index: i);
      },
      separatorBuilder: (ctx, i) {
        return Divider();
      },
    );
  }

  Widget _ListofComment({required int index}) {
    return ListTile(
      title: Text(
        comment[index].name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        comment[index].email,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(comment[index].body),
    );
  }
}
