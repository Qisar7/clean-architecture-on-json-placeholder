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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  comment[index].name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Text(
            comment[index].body,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'email : ',
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                comment[index].email,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
