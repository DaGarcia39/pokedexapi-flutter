import 'package:bloc_pokemon_api/assets/constants/constants.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({
    this.text,
    this.sender,
    this.isMe,
  });

  final String text;
  final String sender;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              sender,
              style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 12.0,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            isMe
                ? Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      Material(
                        borderRadius: isMe
                            ? BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              )
                            : BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                        elevation: 10.0,
                        color: isMe ? kAppPrimaryColor : Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 12.0,
                          ),
                          child: Text(
                            '$text',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: isMe ? Colors.white : Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('lib/assets/img/entrenadorrojo.jpeg'),
                        ),
                      ),
                    ],
                  )
                : Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('lib/assets/img/entrenadorrojo.jpeg'),
                        ),
                      ),
                      Material(
                        borderRadius: isMe
                            ? BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              )
                            : BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                        elevation: 10.0,
                        color: isMe ? kAppPrimaryColor : Colors.white,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 12.0,
                          ),
                          child: Text(
                            '$text',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: isMe ? Colors.white : Colors.black54,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
