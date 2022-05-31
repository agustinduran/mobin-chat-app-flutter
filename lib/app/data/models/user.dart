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
        createdAt: json["createdAt"] != null ? DateTime.parse(json["createdAt"]) : null,
        updatedAt: json["updatedAt"] != null ? DateTime.parse(json["updatedAt"]) : null,
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