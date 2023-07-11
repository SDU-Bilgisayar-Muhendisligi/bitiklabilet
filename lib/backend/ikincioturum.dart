import 'package:bitiklabilet/view/ara/ara.dart';
import 'package:bitiklabilet/view/seyahatlerim/seyahatlerim.dart';
import 'package:bitiklabilet/view/yard%C4%B1m/yard%C4%B1m.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../backend/GirişYapılmışHesap.dart';


class ikinciOturum1 extends StatefulWidget {
  const ikinciOturum1({Key? key}) : super(key: key);

  @override
  State<ikinciOturum1> createState() => ikincioturum2();
}

class ikincioturum2 extends State<ikinciOturum1> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    // Sayfa içerikleri
    Ara(),
    Seyahatlerim(),
    Yardim(),
    ikinciOturum(),
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
          selectedItemColor: Colors.red,
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
