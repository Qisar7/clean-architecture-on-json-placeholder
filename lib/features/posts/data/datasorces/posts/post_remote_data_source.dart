import 'dart:convert';
import 'dart:io';

import '../../../../../core/error/exceptions.dart';
import '../../../../../core/string/appconfig.dart';
import '../../model/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getallpost();
  Future<Unit> addpost(PostModel postModel);
  Future<Unit> deletepost(int id);
  Future<Unit> updatepost(PostModel postModel);
}

class PostRemoteDataSoruceImpl implements PostRemoteDataSource {
  @override
  Future<List<PostModel>> getallpost() async {
    final response = await http.get(Uri.parse('${BASE_URL}posts'), headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
    });

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body) as List;
      final result = data
          .map((postmodeldata) => PostModel.fromjson(postmodeldata))
          .toList();
      print('///// success');
      return result;
    } else {
      print('/////////////${response.statusCode}');
      throw ServerException();
    }
  }

  @override
  Future<Unit> addpost(PostModel postModel) async {
    final Map body = {
      "title": postModel.title,
      "body": postModel.body,
    };

    final response = await http.post(
      Uri.parse("${BASE_URL}posts/"),
      // headers: {
      //   HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      // },
      body: body,
    );

    if (response.statusCode == 201) {
      print('success add ${response.statusCode}');
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> deletepost(int id) async {
    final response = await http.delete(
      Uri.parse("${BASE_URL}posts/$id"),
      // headers: {
      //   HttpHeaders.contentTypeHeader:
      // }
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updatepost(PostModel postModel) async {
    final postid = postModel.id.toString();
    final Map body = {
      "title": postModel.title,
      "body": postModel.body,
    };
    final response = await http.patch(
      Uri.parse("${BASE_URL}posts/$postid"),
      body: body,
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException();
    }
  }
}
