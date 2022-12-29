import '../../domain/entity/comment.dart';

class CommentModel extends EntityComment {
  CommentModel(
      {required int id,
      required String name,
      required String email,
      required String body})
      : super(id: id, body: body, email: email, name: name);

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
