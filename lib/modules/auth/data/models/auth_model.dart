import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
    AuthModel({
        this.success,
        this.user,
        this.token,
    });

    String success;
    User user;
    String token;

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        success: json["success"],
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "user": user.toJson(),
        "token": token,
    };
}

class User {
    User({
        this.id,
        this.name,
        this.email,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String name;
    String email;
    DateTime createdAt;
    DateTime updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}