import 'dart:convert';

// import 'package:video_player/video_player.dart';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {

  int? id;
  String? message;
  int? idReceiver;
  int? idSender;
  int? idChat;
  String? status;
  String? url;
  int? isImage;
  int? isVideo;
  int? timestamp;
  // VideoPlayerController? controller;

  Message({
    this.id,
    this.message,
    this.idReceiver,
    this.idSender,
    this.idChat,
    this.status,
    this.url,
    this.isImage,
    this.isVideo,
    this.timestamp,
    // this.controller
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    message: json["message"],
    idReceiver: json["id_user_receiver"],
    idSender: json["id_user_sender"],
    idChat: json["id_chat"],
    status: json["status"],
    url: json["url"],
    isImage: json["is_image"],
    isVideo: json["is_video"],
    timestamp: json["timestamp"],
  );

  static List<Message> fromJsonList(List<dynamic> jsonList) {
    List<Message> toList = [];

    jsonList.forEach((item) {
      Message message = Message.fromJson(item);
      toList.add(message);
    });

    return toList;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "message": message,
    "id-user-receiver": idReceiver,
    "id-user-sender": idSender,
    "id-chat": idChat,
    "status": status,
    "url": url,
    "is-image": isImage,
    "is-video": isVideo,
    "timestamp": timestamp,
  };
}