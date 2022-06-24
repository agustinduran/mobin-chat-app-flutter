import 'dart:convert';

import 'package:mobin_app/app/data/models/user.dart';

ContactsResponse contactsResponseFromJson(String str) => ContactsResponse.fromJson(json.decode(str));

class ContactsResponse {
    ContactsResponse({
        this.success,
        this.users,
        this.from,
    });

    final bool? success;
    final List<User>? users;
    final String? from;

    factory ContactsResponse.fromJson(Map<String, dynamic> json) => ContactsResponse(
        success: json["success"],
        users: json["data"] == null ? null : List<User>.from(json["data"].map((x) => User.fromJson(x))),
        from: json["from"],
    );

}