// To parse this JSON data, do
//
//     final individualPost = individualPostFromJson(jsonString);

import 'dart:convert';

IndividualPost individualPostFromJson(String str) =>
    IndividualPost.fromJson(json.decode(str));

String individualPostToJson(IndividualPost data) => json.encode(data.toJson());

class IndividualPost {
  IndividualPost({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory IndividualPost.fromJson(Map<String, dynamic> json) => IndividualPost(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
