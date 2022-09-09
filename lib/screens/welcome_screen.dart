import 'package:animate_do/animate_do.dart';
import 'package:bloc_pokemon_api/screens/log_in.dart';
import 'package:bloc_pokemon_api/screens/register.dart';
import 'package:bloc_pokemon_api/widgets/send_information_button.dart';
import 'package:flutter/material.dart';
import '../assets/constants/constants.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppPrimaryColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/img/welcomeScreen.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spin(
                      infinite: true,
                      duration: Duration(seconds: 3),
                      delay: Duration(seconds: 1),
                      child: Image.asset(
                        'lib/assets/img/placeholder_pokeball.png',
                        scale: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ElasticInRight(
                      delay: Duration(seconds: 1),
                      child: Text(
                        'POKEDEX',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SendInformationButton(
                      title: 'Log In',
                      onPressed: () {
                        Navigator.pushNamed(context, LogIn.id);
                      },
                    ),
                    SendInformationButton(
                      title: 'Register',
                      onPressed: () {
                        Navigator.pushNamed(context, Register.id);
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '@DaniDev - 2021',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
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
