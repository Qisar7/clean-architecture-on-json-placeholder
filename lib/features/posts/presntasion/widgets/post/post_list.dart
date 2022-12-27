import '../../../../../core/apptheme/color_manger.dart';
import '../../screens/post_screens/post_details.dart';

import '../../../domain/entity/post.dart';
import 'package:flutter/material.dart';

import '../../screens/comment_screen/commet_screen.dart';

class PostListwidget extends StatelessWidget {
  final List<EntityPost> post;

  const PostListwidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView.separated(
        itemBuilder: (ctx, i) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => PostDetails(post: post[i]),
                    ),
                  );
                },
                leading: Text(
                  post[i].id.toString(),
                ),
                title: Text(
                  post[i].title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  post[i].body,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commentorinfo(
                        ontap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CommentScreen(
                                postid: post[i].id!,
                              ),
                            ),
                          );
                        },
                        text: "COMMENT"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 1,
                        color: MyColors.black,
                      ),
                    ),
                    commentorinfo(
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => PostDetails(post: post[i])));
                        },
                        text: "INFO"),
                  ],
                ),
              ),
            ],
          );
        },
        separatorBuilder: (BuildContext context, i) {
          return const Divider();
        },
        itemCount: post.length,
      ),
    );
  }

  Expanded commentorinfo({required String text, required VoidCallback ontap}) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Container(
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
