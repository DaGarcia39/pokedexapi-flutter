import 'package:bloc_pokemon_api/screens/chat_oak_screen.dart';
import 'package:bloc_pokemon_api/screens/chat_screen.dart';
import 'package:bloc_pokemon_api/screens/search_screen.dart';
import 'package:bloc_pokemon_api/screens/user_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _listPages = [
    SearchScreen(),
    ChatScreen(),
    ChatOakScreen(),
    UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Chat',
              icon: Icon(Icons.chat_outlined),
            ),
            BottomNavigationBarItem(
              label: 'Oak',
              icon: Image.asset(
                'lib/assets/img/oak.png',
                scale: 20.0,
                color: Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(Icons.account_box_outlined),
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: _listPages[_selectedIndex],
      ),
    );
  }
}
