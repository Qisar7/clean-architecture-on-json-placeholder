import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/exceptions.dart';
import '../../model/post_model.dart';

abstract class PostLocalDataSource {
  Future<List<PostModel>> getCachedPost();
  Future<Unit> cachedPost(List<PostModel> postmodel);
}

final String CACHED_POST = 'CACHED_POST';

class PostLocalDataSourceimpl implements PostLocalDataSource {
  final SharedPreferences sharedPreferences;

  PostLocalDataSourceimpl({required this.sharedPreferences});

  @override
  Future<Unit> cachedPost(List<PostModel> postmodel) {
    List postmodeltojson = postmodel.map(
      (e) {
        return PostModel(
          id: e.id,
          title: e.title,
          body: e.body,
        );
      },
    ).toList();
    sharedPreferences.setString(CACHED_POST, json.encode(postmodeltojson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPost() {
    final jsontoString = sharedPreferences.getString(CACHED_POST);
    if (jsontoString != null) {
      List jsondecode = jsonDecode(jsontoString);
      List<PostModel> jsontodartmodel =
          jsondecode.map<PostModel>((jsonpostmodel) {
        return PostModel.fromjson(jsonpostmodel);
      }).toList();
      return Future.value(jsontodartmodel);
    } else {
      throw EmptyDataException();
    }
  }
}
