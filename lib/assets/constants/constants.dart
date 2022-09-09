import 'package:flutter/material.dart';

const kAppPrimaryColor = Color(0xFFED1C22);

ButtonStyle kButtonsStyle = ElevatedButton.styleFrom(
  primary: Color(0xFFED1C22),
);

const String urlPokeApi = 'https://pokeapi.co/api/v2';

const InputDecoration kInputDecoration = InputDecoration(
  // prefixIcon: Icon(Icons.search),
  border: UnderlineInputBorder(),
  hintText: 'Enter a name pokemon',
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
