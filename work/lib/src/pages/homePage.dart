import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:work/src/pages/favoritePage.dart';
import 'package:work/src/pages/friendsPages.dart';
import 'package:work/src/pages/messagePage.dart';
import 'package:work/src/pages/profilePage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  static String nameRoute = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = 0;
  var pages = [FriendsPage(), MessagePage(), FavoritePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    timeDilation = 3;
    return SafeArea(
      child: Container(
        child: Scaffold(
          body: Center(
            child: pages.elementAt(currentPage),
          ),
          bottomNavigationBar: _customBNB(),
        ),
      ),
    );
  }

  Widget _customBNB() {
    return BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined), label: 'Mensajes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'Favoritos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined), label: 'Perfil'),
        ],
        currentIndex: currentPage,
        fixedColor: Color.fromRGBO(254, 221, 124, 1),
        onTap: (int inIndex) {
          setState(() {
            currentPage = inIndex;
          });
        });
  }
}
