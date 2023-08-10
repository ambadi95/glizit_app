// To parse this JSON data, do
//
//     final responseData = responseDataFromMap(jsonString);

import 'dart:convert';

List<ResponseData> responseDataFromMap(String str) => List<ResponseData>.from(json.decode(str).map((x) => ResponseData.fromMap(x)));

String responseDataToMap(List<ResponseData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ResponseData {
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

  ResponseData({
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

  factory ResponseData.fromMap(Map<String, dynamic> json) => ResponseData(
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
