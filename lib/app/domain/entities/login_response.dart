import 'dart:convert';

import '../../data/models/user.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

class LoginResponse {
    LoginResponse({
        required this.success,
        this.token,
        this.user,
    });

    final bool success;
    final String? token;
    final User? user;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
}
