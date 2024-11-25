class User {
  String? sId;
  String? email;
  String? firstName;
  String? lastName;
  String? role;
  int? borderNo;
  int? roomNo;
  String? fcmToken;
  bool? isActive;
  bool? isDeleted;
  String? uid;
  String? createdAt;
  String? updatedAt;

  User(
      {this.sId,
        this.email,
        this.firstName,
        this.lastName,
        this.role,
        this.borderNo,
        this.roomNo,
        this.fcmToken,
        this.isActive,
        this.isDeleted,
        this.uid,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    role = json['role'];
    borderNo = json['borderNo'];
    roomNo = json['roomNo'];
    fcmToken = json['fcmToken'];
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
    uid = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['_id'] = sId;
  //   data['email'] = email;
  //   data['firstName'] = firstName;
  //   data['lastName'] = lastName;
  //   data['role'] = role;
  //   data['password'] = password;
  //   data['borderNo'] = borderNo;
  //   data['roomNo'] = roomNo;
  //   data['fcmToken'] = fcmToken;
  //   data['isActive'] = isActive;
  //   data['isDeleted'] = isDeleted;
  //   data['userId'] = userId;
  //   data['createdAt'] = createdAt;
  //   data['updatedAt'] = updatedAt;
  //   return data;
  // }
}
