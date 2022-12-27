import 'package:equatable/equatable.dart';

class EntityComment extends Equatable {
  final int id;
  final String name;
  final String email;
  final String body;

  EntityComment(
      {required this.id,
      required this.name,
      required this.email,
      required this.body});

  @override
  List<Object?> get props => [id, name, email, body];
}
