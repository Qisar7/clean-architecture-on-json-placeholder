import '../../../../../core/util/snakbar_m.dart';
import '../../../domain/entity/post.dart';
import '../../bloc/post/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Formwidget extends StatefulWidget {
  final bool isupdate;
  final EntityPost? post;

  const Formwidget({super.key, required this.isupdate, required this.post});
  @override
  State<Formwidget> createState() => _FormwidgetState();
}

class _FormwidgetState extends State<Formwidget> {
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _bodycontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.isupdate) {
      _titlecontroller.text = widget.post!.title;
      _bodycontroller.text = widget.post!.body;
    } else {
      _titlecontroller.text = '';
      _bodycontroller.text = '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Formfieldwidget(
                    name: 'title',
                    multiline: false,
                    controller: _titlecontroller),
                const SizedBox(height: 15),
                Formfieldwidget(
                    name: 'body', multiline: true, controller: _bodycontroller),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: validatendaddorupdate,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(widget.isupdate ? "update" : 'add'),
                      Icon(widget.isupdate ? Icons.update : Icons.add),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void validatendaddorupdate() {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      print(isValid);
      final post = EntityPost(
        id: widget.isupdate ? widget.post!.id : null,
        title: _titlecontroller.text,
        body: _bodycontroller.text,
      );
      if (widget.isupdate) {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context)
            .add(UpdatePostEvent(post: post));
      } else {
        BlocProvider.of<AddDeleteUpdatePostBloc>(context).add(
          AddPostEvent(post: post),
        );
      }
    } else {
      MySnakBar.errorsnakbarmessage('not valid', context);
    }
  }
}
