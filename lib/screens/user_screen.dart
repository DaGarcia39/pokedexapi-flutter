import 'package:bloc_pokemon_api/screens/welcome_screen.dart';
import 'package:bloc_pokemon_api/widgets/send_information_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class UserScreen extends StatefulWidget {
  static const String id = 'UserScreen';
  const UserScreen({Key key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final _auth = FirebaseAuth.instance;
  bool _showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Current User',
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Icon(
                  Icons.account_circle_outlined,
                  color: Colors.grey,
                  size: 250.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: SendInformationButton(
                    title: 'Log Out',
                    onPressed: () {
                      _auth.signOut();
                      setState(() {
                        _showSpinner = true;
                      });
                      Navigator.pushNamed(context, WelcomeScreen.id);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
