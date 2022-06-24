import 'dart:convert';

import 'package:mobin_app/app/data/models/user.dart';

UserResponse userResponseFromJson(String str) => UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
    UserResponse({
        this.success,
        this.user,
        this.from,
        this.message
    });

    bool? success;
    User? user;
    String? from;
    String? message;

    factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        success: json["success"],
        user: json["data"] != null ? User.fromJson(json["data"]) : null,
        from: json["from"],
        message: json["message"]
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "user": user?.toJson(),
        "from": from,
        "message": message,
    };
}