// To parse this JSON data, do
//
//     final blockUserModel = blockUserModelFromJson(jsonString);

import 'dart:convert';

BlockUserModel blockUserModelFromJson(String str) =>
    BlockUserModel.fromJson(json.decode(str));

String blockUserModelToJson(BlockUserModel data) => json.encode(data.toJson());

class BlockUserModel {
  bool success;
  List<BlockedUser> blockedUsers;

  BlockUserModel({
    required this.success,
    required this.blockedUsers,
  });

  factory BlockUserModel.fromJson(Map<String, dynamic> json) => BlockUserModel(
        success: json["success"],
        blockedUsers: List<BlockedUser>.from(
            json["blocked_users"].map((x) => BlockedUser.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "blocked_users":
            List<dynamic>.from(blockedUsers.map((x) => x.toJson())),
      };
}

class BlockedUser {
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
  String profilePicture;
  dynamic coverImage;
  dynamic otp;
  dynamic referenceId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic currentRoomId;
  String profilePictureUrl;
  String coverImageUrl;
  Pivot pivot;

  BlockedUser({
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
    required this.profilePictureUrl,
    required this.coverImageUrl,
    required this.pivot,
  });

  factory BlockedUser.fromJson(Map<String, dynamic> json) => BlockedUser(
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
        profilePictureUrl: json["profile_picture_url"],
        coverImageUrl: json["cover_image_url"],
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
        "profile_picture_url": profilePictureUrl,
        "cover_image_url": coverImageUrl,
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  int userId;
  int blockedUserId;

  Pivot({
    required this.userId,
    required this.blockedUserId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        blockedUserId: json["blocked_user_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "blocked_user_id": blockedUserId,
      };
}
