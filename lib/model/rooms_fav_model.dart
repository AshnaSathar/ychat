// To parse this JSON data, do
//
//     final roomsFavModel = roomsFavModelFromJson(jsonString);

import 'dart:convert';

RoomsFavModel roomsFavModelFromJson(String str) =>
    RoomsFavModel.fromJson(json.decode(str));

String roomsFavModelToJson(RoomsFavModel data) => json.encode(data.toJson());

class RoomsFavModel {
  bool success;
  List<Favorite> favorites;

  RoomsFavModel({
    required this.success,
    required this.favorites,
  });

  factory RoomsFavModel.fromJson(Map<String, dynamic> json) => RoomsFavModel(
        success: json["success"],
        favorites: List<Favorite>.from(
            json["favorites"].map((x) => Favorite.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "favorites": List<dynamic>.from(favorites.map((x) => x.toJson())),
      };
}

class Favorite {
  int id;
  String name;
  int categoryId;
  int ownerId;
  int isPublic;
  int isEnable;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  Favorite({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.ownerId,
    required this.isPublic,
    required this.isEnable,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
        ownerId: json["owner_id"],
        isPublic: json["is_public"],
        isEnable: json["is_enable"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category_id": categoryId,
        "owner_id": ownerId,
        "is_public": isPublic,
        "is_enable": isEnable,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pivot": pivot.toJson(),
      };
}

class Pivot {
  int userId;
  int roomId;
  DateTime createdAt;
  DateTime updatedAt;

  Pivot({
    required this.userId,
    required this.roomId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"],
        roomId: json["room_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "room_id": roomId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
