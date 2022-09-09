import 'package:bloc_pokemon_api/assets/constants/constants.dart';
import 'package:bloc_pokemon_api/models/user_secure_storage.dart';
import 'package:bloc_pokemon_api/screens/home_page.dart';
import 'package:bloc_pokemon_api/screens/register.dart';
import 'package:bloc_pokemon_api/widgets/send_information_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LogIn extends StatefulWidget {
  static const String id = 'log_in';
  LogIn({Key key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _keyForm = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  bool _showSpinner = false;

  @override
  void initState() {
    super.initState();
    initSecureStorage();
  }

  void initSecureStorage() async {
    final email = await UserSecureStorage.getUserEmail() ?? '';

    setState(() {
      this.controllerEmail.text = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Log In'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: Form(
                  key: _keyForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.account_circle_outlined,
                        size: 140.0,
                        color: kAppPrimaryColor,
                      ),
                      Text(
                        'LOG IN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 35.0,
                        ),
                      ),
                      SizedBox(
                        height: 60.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter some email';
                          }
                          if (!value.contains('@')) {
                            return 'must contain an @';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        controller: controllerEmail,
                        decoration: kInputDecoration.copyWith(
                          hintText: 'Enter your email',
                          icon: Icon(
                            Icons.email_outlined,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value.length < 6) {
                            return 'The password must have a minimum of 6 characters';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        controller: controllerPassword,
                        obscureText: true,
                        decoration: kInputDecoration.copyWith(
                          hintText: 'Enter your password',
                          icon: Icon(
                            Icons.vpn_key_outlined,
                          ),
                        ),
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      SendInformationButton(
                        title: 'Send',
                        onPressed: () async {
                          if (_keyForm.currentState.validate()) {
                            setState(() {
                              _showSpinner = true;
                            });

                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                email: controllerEmail.text,
                                password: controllerPassword.text,
                              );
                              if (user != null) {
                                Navigator.pushNamed(context, HomePage.id);
                              }
                              setState(() {
                                _showSpinner = false;
                              });
                            } catch (e) {
                              print(e);
                              Alert(
                                context: context,
                                type: AlertType.error,
                                title: 'Invalid User',
                                buttons: [
                                  DialogButton(
                                    color: Color(0xFFED1C22),
                                    child: Text(
                                      'Back',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ).show();
                              setState(() {
                                _showSpinner = false;
                              });
                            }
                          } else {
                            print('Problems');
                          }
                        },
                      ),
                      TextButton(
                        onPressed: () async {
                          if (_keyForm.currentState.validate()) {
                            Navigator.pushNamed(context, Register.id);
                          } else {
                            Alert(
                              type: AlertType.error,
                              context: context,
                              title: 'an error has occurred, check the form',
                            ).show();
                          }
                        },
                        child: Text('Create account'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
