import 'package:bitiklabilet/view/ara/ara.dart';
import 'package:bitiklabilet/view/seyahatlerim/seyahatlerim.dart';
import 'package:bitiklabilet/view/yard%C4%B1m/yard%C4%B1m.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'GirişYapılmışHesap.dart';
import 'ilk_oturum.dart';


class oturumcikis extends StatefulWidget {
  const oturumcikis({Key? key}) : super(key: key);

  @override
  State<oturumcikis> createState() => cikisoturumu();
}

class cikisoturumu extends State<oturumcikis> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    // Sayfa içerikleri
    Ara(),
    Seyahatlerim(),
    Yardim(),
    ilkOturum(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search),
              label: 'Ara',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bus),
              label: 'Seyahatlerim',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.question_circle),
              label: 'Yardım',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Hesabım',
            ),
          ],
        ),
      ),
    );
  }
}
