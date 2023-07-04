import 'package:flutter/material.dart';

const String arkaRenk="FF0000";
const String metinRenk="000000";

class Renk extends Color{
  static int _donustur(String hexColor){
    hexColor=hexColor.toUpperCase().replaceAll("#", "");
    if(hexColor.length==6){
      hexColor="FF$hexColor";
    }
    return int.parse(hexColor,radix:16);
  }

  Renk(final String renkKodu): super(_donustur(renkKodu));
}