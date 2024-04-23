// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  bool success;
  User user;
  dynamic profilePictureUrl;
  dynamic coverImageUrl;

  ProfileModel({
    required this.success,
    required this.user,
    required this.profilePictureUrl,
    required this.coverImageUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"],
        user: User.fromJson(json["user"]),
        profilePictureUrl: json["profile_picture_url"],
        coverImageUrl: json["cover_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "user": user.toJson(),
        "profile_picture_url": profilePictureUrl,
        "cover_image_url": coverImageUrl,
      };
}

class User {
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
  dynamic otp;
  dynamic referenceId;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic currentRoomId;
  String profilePictureUrl;
  String coverImageUrl;

  User({
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
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
      };
}
