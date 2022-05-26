import 'dart:convert';

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
        user: json["user"] != null ? User.fromJson(json["user"]) : null,
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

class User {
    User({
        this.id,
        this.username,
        this.email,
        this.name,
        this.surname,
        this.phone,
        this.password,
        this.passwordConfirmation,
        this.roles,
        this.active,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? username;
    String? email;
    String? name;
    String? surname;
    String? phone;
    String? password;
    String? passwordConfirmation;
    String? roles;
    int? active;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        name: json["name"],
        surname: json["surname"],
        phone: json["phone"],
        roles: json["roles"],
        active: json["active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "name": name,
        "password": password,
        "password-confirmation": passwordConfirmation,
        "surname": surname,
        "phone": phone,
    };
}
