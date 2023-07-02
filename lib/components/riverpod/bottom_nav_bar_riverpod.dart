import 'package:bitiklabilet/view/ara/ara.dart';
import 'package:bitiklabilet/view/hesab%C4%B1m/oturum/ilk_oturum.dart';
import 'package:bitiklabilet/view/yard%C4%B1m/yard%C4%B1m.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../view/seyahatlerim/seyahatlerim.dart';

class BottomNavBarRiverpod extends ChangeNotifier{
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search) ,label:"Ara" ,backgroundColor: Colors.grey),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.bus), label: "Seyahatlerim"),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.question_circle) , label: "Yardım"),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled) ,label: "Hesabım"),
  ];

  int currentIndex=0;

  void setCurrentIndex(int index){
    currentIndex=index;
    notifyListeners();
  }

  Widget body(){
    switch(currentIndex){
      case 0:
        return Ara();
      case 1:
        return Seyahatlerim();
      case 2:
        return Yardim();
      case 3:
        return IlkOturum();
      default:
        return Ara();

    }
  }


}