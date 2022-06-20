import 'package:mobin_app/app/data/environment.dart';
import 'package:flutter/material.dart';

class BubbleImage extends StatelessWidget {
  BubbleImage({this.message = '', this.time = '', this.delivered, this.isMe, this.isImage = false, this.url = '', this.status = ''});

  final String message, time, url, status;
  final delivered, isMe, isImage;

  @override
  Widget build(BuildContext context) {
    final bg = isMe ? Colors.white : Environment.COLOR_PRIMARY;
    final align = isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final icon = status == 'SENDED' ? Icons.done : status == 'RECEIVED' ? Icons.done_all : Icons.done_all;
    final radius = isMe
        ? const BorderRadius.only(
      topRight: Radius.circular(5.0),
      bottomLeft: Radius.circular(10.0),
      bottomRight: Radius.circular(5.0),
    )
        : const BorderRadius.only(
      topLeft: Radius.circular(5.0),
      bottomLeft: Radius.circular(5.0),
      bottomRight: Radius.circular(10.0),
    );
    return Column(
      crossAxisAlignment: align,
      children: <Widget>[
        Container(
          margin:  EdgeInsets.only(right: isMe == true ? 3 : 70, left: isMe == true ? 70 : 3, top: 5, bottom: 5),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: .5,
                  spreadRadius: 1.0,
                  color: Colors.black.withOpacity(.12))
            ],
            color: bg,
            borderRadius: radius,
          ),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 22),
                child: isImage
                ? FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: Environment.IMG_USER_PROFILE_DEFAULT_EXTERNAL /*"assets/img/user_profile_2.png"*/,
                    image: url
                )
                : Text(message),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Row(
                  children: <Widget>[
                    Text(time,
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.0,
                        )),
                    SizedBox(width: 3.0),
                    isMe == true ? Icon(
                      icon,
                      size: 12.0,
                      color: status == 'VIEWED' ? Colors.blue : Colors.black38,
                    ) : Container()
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}