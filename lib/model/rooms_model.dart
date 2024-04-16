import 'dart:convert';

RoomsModel roomsModelFromJson(String str) =>
    RoomsModel.fromJson(json.decode(str));

String roomsModelToJson(RoomsModel data) => json.encode(data.toJson());

class RoomsModel {
  bool success;
  String message;
  List<Category> categories;

  RoomsModel({
    required this.success,
    required this.message,
    required this.categories,
  });

  factory RoomsModel.fromJson(Map<String, dynamic> json) => RoomsModel(
        success: json["success"],
        message: json["message"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  int id;
  String name;
  int? parentId;
  DateTime createdAt;
  DateTime updatedAt;
  List<Subcategory> subcategories;
  List<ChatRoom> chatRooms;

  Category({
    required this.id,
    required this.name,
    required this.parentId,
    required this.createdAt,
    required this.updatedAt,
    required this.subcategories,
    required this.chatRooms,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        subcategories: List<Subcategory>.from(
            json["subcategories"].map((x) => Subcategory.fromJson(x))),
        chatRooms: List<ChatRoom>.from(
            json["chat_rooms"].map((x) => ChatRoom.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "subcategories":
            List<dynamic>.from(subcategories.map((x) => x.toJson())),
        "chat_rooms": List<dynamic>.from(chatRooms.map((x) => x.toJson())),
      };
}

class ChatRoom {
  int id;
  String name;
  int categoryId;
  int ownerId;
  int isPublic;
  int isEnable;
  DateTime createdAt;
  DateTime updatedAt;

  ChatRoom({
    required this.id,
    required this.name,
    required this.categoryId,
    required this.ownerId,
    required this.isPublic,
    required this.isEnable,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json) => ChatRoom(
        id: json["id"],
        name: json["name"],
        categoryId: json["category_id"],
        ownerId: json["owner_id"],
        isPublic: json["is_public"],
        isEnable: json["is_enable"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
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
      };
}

class Subcategory {
  int id;
  String name;
  int parentId;
  DateTime createdAt;
  DateTime updatedAt;

  Subcategory({
    required this.id,
    required this.name,
    required this.parentId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        name: json["name"],
        parentId: json["parent_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "parent_id": parentId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
