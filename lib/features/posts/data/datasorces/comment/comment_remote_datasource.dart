import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/string/appconfig.dart';
import '../../model/comment_model.dart';

abstract class CommentRemoteDataSource {
  Future<List<CommentModel>> getallcomment();
  Future<List<CommentModel>> getpostcomment(int postid);
}

class CommentRemoteDataSourceimpl implements CommentRemoteDataSource {
  @override
  Future<List<CommentModel>> getallcomment() async {
    final response = await http.get(
      Uri.parse('${BASE_URL}comments'),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body) as List;
      final result = data.map((e) => CommentModel.fromJson(e)).toList();
      print('/////////////$result');

      return result;
    } else {
      print('/////////////');
      throw ServerException();
    }
  }

  @override
  Future<List<CommentModel>> getpostcomment(int postid) async {
    final response =
        await http.get(Uri.parse("${BASE_URL}posts/$postid/comments"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;

      final result = data.map((e) => CommentModel.fromJson(e)).toList();
      print('/////////////$result');

      return result;
    } else {
      print('/////////////postcomment');

      throw ServerException();
    }
  }
}
