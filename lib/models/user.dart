// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.user,
    required this.data,
  });

  UserClass user;
  String data;

  factory User.fromJson(Map<String, dynamic> json) => User(
        user: UserClass.fromJson(json["user"]),
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "data": data,
      };
}

class UserClass {
  UserClass({
    required this.id,
    required this.userId,
    required this.username,
    required this.email,
    required this.password,
    required this.userType,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String userId;
  String username;
  String email;
  String password;
  String userType;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["_id"],
        userId: json["user_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        userType: json["user_type"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_id": userId,
        "username": username,
        "email": email,
        "password": password,
        "user_type": userType,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
