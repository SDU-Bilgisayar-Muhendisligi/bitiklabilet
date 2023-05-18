import 'package:flutter/material.dart';

const String arka_renk="FF0000";
const String metin_renk="7F8C99";

class renk extends Color{
  static int _donustur(String hexColor){
    hexColor=hexColor.toUpperCase().replaceAll("#", "");
    if(hexColor.length==6){
      hexColor="FF" + hexColor;
    }
    return int.parse(hexColor,radix:16);
  }

  renk(final String renk_kodu): super(_donustur(renk_kodu));
}