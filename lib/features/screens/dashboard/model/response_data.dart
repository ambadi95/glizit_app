// To parse this JSON data, do
//
//     final postDataUiModel = postDataUiModelFromMap(jsonString);

import 'dart:convert';

PostDataUiModel postDataUiModelFromMap(String str) => PostDataUiModel.fromMap(json.decode(str));

String postDataUiModelToMap(PostDataUiModel data) => json.encode(data.toMap());

class PostDataUiModel {
  final List<Post>? posts;

  PostDataUiModel({
    this.posts,
  });

  factory PostDataUiModel.fromMap(Map<String, dynamic> json) => PostDataUiModel(
    posts: json["posts"] == null ? [] : List<Post>.from(json["posts"]!.map((x) => Post.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x.toMap())),
  };
}

class Post {
  final String? id;
  final String? title;
  final String? thumbnailUrl;
  final String? duration;
  final String? uploadTime;
  final String? views;
  final String? author;
  final String? videoUrl;
  final String? description;
  final String? subscriber;
  final bool? isLive;

  Post({
    this.id,
    this.title,
    this.thumbnailUrl,
    this.duration,
    this.uploadTime,
    this.views,
    this.author,
    this.videoUrl,
    this.description,
    this.subscriber,
    this.isLive,
  });

  factory Post.fromMap(Map<String, dynamic> json) => Post(
    id: json["id"],
    title: json["title"],
    thumbnailUrl: json["thumbnailUrl"],
    duration: json["duration"],
    uploadTime: json["uploadTime"],
    views: json["views"],
    author: json["author"],
    videoUrl: json["videoUrl"],
    description: json["description"],
    subscriber: json["subscriber"],
    isLive: json["isLive"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "thumbnailUrl": thumbnailUrl,
    "duration": duration,
    "uploadTime": uploadTime,
    "views": views,
    "author": author,
    "videoUrl": videoUrl,
    "description": description,
    "subscriber": subscriber,
    "isLive": isLive,
  };
}
