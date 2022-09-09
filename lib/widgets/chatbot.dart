import 'package:bloc_pokemon_api/assets/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:bubble/bubble.dart';

Widget chatBot(String message, int data) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: Row(
      mainAxisAlignment:
          data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        data == 0
            ? Container(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage("lib/assets/img/professorOak.jpeg"),
                ),
              )
            : Container(),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Bubble(
              radius: Radius.circular(15.0),
              color: data == 0
                  ? Color.fromRGBO(23, 157, 139, 1)
                  : kAppPrimaryColor,
              elevation: 0.0,
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(
                      width: 10.0,
                    ),
                    Flexible(
                        child: Container(
                      constraints: BoxConstraints(maxWidth: 200),
                      child: Text(
                        message,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ))
                  ],
                ),
              )),
        ),
        data == 1
            ? Container(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage("lib/assets/img/entrenadorrojo.jpeg"),
                ),
              )
            : Container(),
      ],
    ),
  );
}
