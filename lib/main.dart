import 'package:bloc_pokemon_api/assets/constants/constants.dart';
import 'package:bloc_pokemon_api/screens/log_in.dart';
import 'package:bloc_pokemon_api/screens/register.dart';
import 'package:bloc_pokemon_api/screens/search_screen.dart';
import 'package:bloc_pokemon_api/screens/user_screen.dart';
import 'package:bloc_pokemon_api/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import './screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: kAppPrimaryColor,
      ),
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomePage.id: (context) => HomePage(),
        LogIn.id: (context) => LogIn(),
        Register.id: (context) => Register(),
        SearchScreen.id: (context) => SearchScreen(),
        UserScreen.id: (context) => UserScreen(),
      },
    );
  }
}
