import 'package:bloc_pokemon_api/assets/constants/constants.dart';
import 'package:bloc_pokemon_api/widgets/chatbot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ChatOakScreen extends StatefulWidget {
  @override
  _ChatOakScreenState createState() => _ChatOakScreenState();
}

class _ChatOakScreenState extends State<ChatOakScreen> {
  final messageTextController = TextEditingController();
  String messageText;

  void response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "lib/assets/service.json").build();
    Dialogflow dialogflow =
        Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
    });

    print(aiResponse.getListMessage()[0]["text"]["text"][0].toString());
  }

  List<Map> messsages = [];

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
                desc: 'Information about this bot chat.',
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
            Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: messsages.length,
                  itemBuilder: (context, index) => chatBot(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"],
                      )),
            ),
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
                        decoration: kMessageTextFieldDecoration.copyWith(
                          hintText: 'Type your question here...',
                        ),
                        onChanged: (value) {},
                      ),
                    ),
                    ElevatedButton(
                      style: kButtonsStyle,
                      onPressed: () {
                        if (messageTextController.text.isEmpty) {
                          print('empty message');
                        } else {
                          setState(() {
                            messsages.insert(0, {
                              "data": 1,
                              "message": messageTextController.text
                            });
                          });
                          response(messageTextController.text);
                          print(messageTextController.text);
                          messageTextController.clear();
                        }
                        FocusScopeNode currentFocus = FocusScope.of(context);
                        if (!currentFocus.hasPrimaryFocus) {
                          currentFocus.unfocus();
                        }
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
