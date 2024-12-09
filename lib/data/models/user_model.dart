import 'dart:convert';
class User {
  String id;
  String email;
  String firstName;
  String lastName;
  String role;
  String? password;
  int borderNo;
  int roomNo;
  String fcmToken;
  bool? isActive;
  bool? isDeleted;
  String userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.role,
    this.password,
    required this.borderNo,
    required this.roomNo,
    required this.fcmToken,
    this.isActive,
    this.isDeleted,
    required this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"]??'null',
        email: json["email"]??'null',
        firstName: json["firstName"]??'null',
        lastName: json["lastName"]??'null',
        role: json["role"]??'null',
        password: json["password"]??'null',
        borderNo: json["borderNo"]??0,
        roomNo: json["roomNo"]??0,
        fcmToken: json["fcmToken"]??'null',
        isActive: json["isActive"]??true,
        isDeleted: json["isDeleted"]??false,
        userId: json["userId"]??'null',
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "role": role,
        "password": password??'',
        "borderNo": borderNo,
        "roomNo": roomNo,
        "fcmToken": fcmToken,
        "isActive": isActive??true,
        "isDeleted": isDeleted??false,
        "userId": userId,
        "createdAt": createdAt?.toIso8601String() ?? "",
        "updatedAt": updatedAt?.toIso8601String() ?? "",
      };
}
