import 'dart:convert';

class User {
  String id;
  String email;
  String firstName;
  String lastName;
  String role;
  String password;
  int borderNo;
  int roomNo;
  String fcmToken;
  bool isActive;
  bool isDeleted;
  String userId;
  DateTime createdAt;
  DateTime updatedAt;
  bool iSPermittedForMeal;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.password,
    required this.borderNo,
    required this.roomNo,
    required this.fcmToken,
    required this.isActive,
    required this.isDeleted,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.iSPermittedForMeal,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    email: json["email"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    role: json["role"],
    password: json["password"],
    borderNo: json["borderNo"],
    roomNo: json["roomNo"],
    fcmToken: json["fcmToken"],
    isActive: json["isActive"],
    isDeleted: json["isDeleted"],
    userId: json["userId"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    iSPermittedForMeal: json["iSPermittedForMeal"]??false,
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "email": email,
    "firstName": firstName,
    "lastName": lastName,
    "role": role,
    "password": password,
    "borderNo": borderNo,
    "roomNo": roomNo,
    "fcmToken": fcmToken,
    "isActive": isActive,
    "isDeleted": isDeleted,
    "userId": userId,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "iSPermittedForMeal": iSPermittedForMeal,
  };
}
