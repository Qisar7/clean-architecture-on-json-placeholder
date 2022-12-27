import 'dart:convert';

import '../../domain/entity/comment.dart';

class CommentModel extends EntityComment {
  CommentModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.body});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      body: json["body"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
