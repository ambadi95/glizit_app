import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/response_data.dart';

class PostsRepo {
  static Future<List<Post>> fetchPosts() async {
    PostDataUiModel postDataUiModel;
    final String response = await rootBundle.loadString('assets/data.json');
    postDataUiModel = PostDataUiModel.fromMap(json.decode(response));
    List<Post> list = postDataUiModel.posts!;


    return list;
  }
}
