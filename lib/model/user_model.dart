// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool success;
  List<User> users;

  UserModel({
    required this.success,
    required this.users,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        success: json["success"],
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  int id;
  String name;
  String userName;
  DateTime dob;
  Gender gender;
  String email;
  String mobileNumber;
  String bio;
  Status status;
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
  CoverImageUrl coverImageUrl;

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
        gender: genderValues.map[json["gender"]]!,
        email: json["email"],
        mobileNumber: json["mobile_number"],
        bio: json["bio"],
        status: statusValues.map[json["status"]]!,
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
        coverImageUrl: coverImageUrlValues.map[json["cover_image_url"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_name": userName,
        "dob":
            "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "gender": genderValues.reverse[gender],
        "email": email,
        "mobile_number": mobileNumber,
        "bio": bio,
        "status": statusValues.reverse[status],
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
        "cover_image_url": coverImageUrlValues.reverse[coverImageUrl],
      };
}

enum CoverImageUrl { STORAGE }

final coverImageUrlValues = EnumValues({"/storage/": CoverImageUrl.STORAGE});

enum Gender { FEMALE, GENDER_MALE, MALE, OTHER }

final genderValues = EnumValues({
  "female": Gender.FEMALE,
  "Male": Gender.GENDER_MALE,
  "male": Gender.MALE,
  "other": Gender.OTHER
});

enum Status { OFFLINE }

final statusValues = EnumValues({"offline": Status.OFFLINE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
