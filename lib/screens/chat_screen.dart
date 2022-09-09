import 'package:bloc_pokemon_api/assets/constants/constants.dart';
import 'package:bloc_pokemon_api/bloc/chatBloc.dart';
import 'package:bloc_pokemon_api/models/user_secure_storage.dart';
import 'package:bloc_pokemon_api/widgets/messages_stream.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatBloc = ChatBloc();
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  final messageTextController = TextEditingController();
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        // print(loggedInUser.email);
      }
    } catch (e) {}
    await UserSecureStorage.setUserEmail(
      loggedInUser.email,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          TextButton(
            onPressed: () {
              Alert(
                context: context,
                type: AlertType.info,
                title: 'Info chat',
                desc: 'Information about this chat.',
              ).show();
            },
            child: Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MessagesStreamChat(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        decoration: kMessageTextFieldDecoration,
                        onChanged: (value) {
                          messageText = value;
                        },
                      ),
                    ),
                    ElevatedButton(
                      style: kButtonsStyle,
                      onPressed: () {
                        chatBloc.sendMessage(
                          textMessage: messageText,
                          sender: loggedInUser.email,
                        );
                        messageTextController.clear();
                      },
                      child: Icon(
                        Icons.send_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
