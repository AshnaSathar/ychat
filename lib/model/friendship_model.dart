// To parse this JSON data, do
//
//     final friendListModel = friendListModelFromJson(jsonString);

import 'dart:convert';

FriendListModel friendListModelFromJson(String str) =>
    FriendListModel.fromJson(json.decode(str));

String friendListModelToJson(FriendListModel data) =>
    json.encode(data.toJson());

class FriendListModel {
  bool success;
  List<Friend> friends;

  FriendListModel({
    required this.success,
    required this.friends,
  });

  factory FriendListModel.fromJson(Map<String, dynamic> json) =>
      FriendListModel(
        success: json["success"],
        friends:
            List<Friend>.from(json["friends"].map((x) => Friend.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "friends": List<dynamic>.from(friends.map((x) => x.toJson())),
      };
}

class Friend {
  int id;
  String name;
  String userName;
  DateTime dob;
  String gender;
  String email;
  String mobileNumber;
  String bio;
  String status;
  DateTime lastActiveAt;
  DateTime emailVerifiedAt;
  dynamic profilePicture;
  dynamic coverImage;
  String? otp;
  String? referenceId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic currentRoomId;
  Pivot pivot;

  Friend({
    required this.id,
    required this.name,
    required this.userName,
    required this.dob,
    required this.gender,
    required this.email,
    required this.mobileNumber,
    required this.bio,
    required this.status,
    required this.lastActiveAt,
    required this.emailVerifiedAt,
    required this.profilePicture,
    required this.coverImage,
    required this.otp,
    required this.referenceId,
    required this.createdAt,
    required this.updatedAt,
    required this.currentRoomId,
    required this.pivot,
  });

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        id: json["id"],
        name: json["name"],
        userName: json["user_name"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        bio: json["bio"],
        status: json["status"],
        lastActiveAt: DateTime.parse(json["last_active_at"]),
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        profilePicture: json["profile_picture"],
        coverImage: json["cover_image"],
        otp: json["otp"],
        referenceId: json["reference_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        currentRoomId: json["current_room_id"],
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_name": userName,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "email": email,
        "mobile_number": mobileNumber,
        "bio": bio,
        "status": status,
        "last_active_at": lastActiveAt.toIso8601String(),
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "profile_picture": profilePicture,
        "cover_image": coverImage,
        "otp": otp,
        "reference_id": referenceId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "current_room_id": currentRoomId,
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  int userId;
  int friendUserId;

  Pivot({
    required this.userId,
    required this.friendUserId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        friendUserId: json["friend_user_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "friend_user_id": friendUserId,
      };
}
