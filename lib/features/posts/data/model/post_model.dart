import '../../domain/entity/post.dart';

class PostModel extends EntityPost {
  const PostModel({int? id, required String title, required String body})
      : super(id: id, title: title, body: body);

  factory PostModel.fromjson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'],
      title: json['title'], // TODO: throw exc for test
      body: json['body'], // TODO throw exc fot test
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
