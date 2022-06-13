import 'dart:convert';

GeneralResponse generalResponseFromJson(String str) => GeneralResponse.fromJson(json.decode(str));

String generalResponseToJson(GeneralResponse data) => json.encode(data.toJson());

class GeneralResponse {

  bool? success;
  String? message;
  String? from;
  dynamic data;

  GeneralResponse({
    this.success,
    this.message,
    this.data,
    this.from
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) => GeneralResponse(
    success: json["success"],
    message: json["message"],
    data: json["data"],
    from: json["from"]
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data,
    "from": from
  };
}