import 'dart:async';

import 'package:bloc_pokemon_api/bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatBloc implements Bloc {
  //controller
  // ignore: close_sinks
  StreamController _dataMessageController = StreamController();

  Stream get dataPokemonStream => _dataMessageController.stream;

  Future<void> getMessages() async {}

  final _firestore = Firestore.instance;

  sendMessage({String textMessage, String sender}) {
    _firestore.collection('group1').add({
      'text': textMessage,
      'sender': sender,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  @override
  dispose() {
    _dataMessageController.close();
  }
}
