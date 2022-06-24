import 'dart:convert';

Chat chatFromJson(String str) => Chat.fromJson(json.decode(str));

String chatToJson(Chat data) => json.encode(data.toJson());

class Chat {

  int? id;
  int? idUser1;
  int? idUser2;
  int? timestamp;

  // USER 1
  String? nameUser1;
  String? lastnameUser1;
  String? imageUser1;

  // USER 2
  String? nameUser2;
  String? lastnameUser2;
  String? imageUser2;

  String? lastMessage;
  int? unreadMessage;
  int? lastMessageTimestamp;

  Chat({
    this.id,
    this.idUser1,
    this.idUser2,
    this.timestamp,
    // USER 1
    this.nameUser1,
    this.lastnameUser1,
    this.imageUser1,
    // USER 2
    this.nameUser2,
    this.lastnameUser2,
    this.imageUser2,

    this.lastMessage,
    this.unreadMessage,
    this.lastMessageTimestamp,

  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    id: json["id"],
    idUser1: json["id-user-transmitter"],
    idUser2: json["id-user-receiver"],
    timestamp: json["timestamp"],
    // USER 1
    nameUser1: json["name_user1"],
    lastnameUser1: json["lastname_user1"],
    imageUser1: json["image_user1"],

    // USER 2
    nameUser2: json["name_user2"],
    lastnameUser2: json["lastname_user2"],
    imageUser2: json["image_user2"],

    lastMessage: json["last_message"],
    unreadMessage: json["unread_message"] ?? 0,
    lastMessageTimestamp: json["last_message_timestamp"] ?? 0,

  );

  static List<Chat> fromJsonList(List<dynamic> jsonList) {
    List<Chat> toList = [];

    jsonList.forEach((item) {
      Chat chat = Chat.fromJson(item);
      toList.add(chat);
    });

    return toList;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "id-user-transmitter": idUser1,
    "id-user-receiver": idUser2,
    "timestamp": timestamp,
    // USER 1
    "name_user1": nameUser1,
    "lastname_user1": lastnameUser1,
    "image_user1": imageUser1,
    // USER 2
    "name_user2": nameUser2,
    "lastname_user2": lastnameUser2,
    "image_user2": imageUser2,
    "last_message": lastMessage,
    "unread_message": unreadMessage,
    "last_message_timestamp": lastMessageTimestamp,
  };
}