import '../../../domain/entity/post.dart';
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
          onPressed: () {},
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
