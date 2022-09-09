import 'package:bloc_pokemon_api/assets/constants/constants.dart';
import 'package:bloc_pokemon_api/screens/home_page.dart';
import 'package:bloc_pokemon_api/screens/log_in.dart';
import 'package:bloc_pokemon_api/widgets/send_information_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Register extends StatefulWidget {
  static const String id = 'register';
  const Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _keyForm = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String _email;
  String _password;
  bool _showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Register'),
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
                          Icons.fact_check,
                          size: 140.0,
                          color: kAppPrimaryColor,
                        ),
                        Text(
                          'REGISTER',
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
                          decoration: kInputDecoration.copyWith(
                            hintText: 'Enter your email',
                            icon: Icon(
                              Icons.email_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          onChanged: (value) {
                            _email = value;
                          },
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.length < 6) {
                              return 'The password must have a minimum of 6 characters';
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: kInputDecoration.copyWith(
                            hintText: 'Enter your password',
                            icon: Icon(
                              Icons.vpn_key_outlined,
                            ),
                          ),
                          onChanged: (value) {
                            _password = value;
                          },
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
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                  email: _email,
                                  password: _password,
                                );
                                if (newUser != null) {
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
                                  title: 'User Already exists.',
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
                                      // width: 120,
                                    ),
                                  ],
                                ).show();
                                setState(() {
                                  _showSpinner = false;
                                });
                              }
                            } else {
                              print('problems');
                            }
                          },
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LogIn.id);
                          },
                          child: Text('Already have an account - Sign In'),
                        ),
                      ],
                    ),
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
