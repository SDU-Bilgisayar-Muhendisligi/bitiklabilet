import 'package:bitiklabilet/sabitler/tema.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../sabitler/ext.dart';



class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({Key? key}) : super(key: key);


  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi>{
  Tema tema=Tema();
  @override
  Widget build(BuildContext context){
    return SafeArea( //en üstteki menübarı ayırır
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: renk(
                arka_renk,
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 180,
                  height: 180,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: renk("2D2F3A"),
                        width: 15,
                      ),
                    ),
                    child: const Icon(
                      Icons.login,
                      size: 45,
                    ),
                  ),
                ),
                Container(
                  margin:EdgeInsets.only(top: 20),
                  child: Text(
                    "Giriş Yapın",
                    style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  decoration: tema.inputBoxDec(),
                  margin: EdgeInsets.only(top:10,bottom: 10,right: 30,left: 30),
                  padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                  child: TextFormField(
                    decoration: tema.inputDec(
                        "E-Posta Adresinizi Girin",Icons.people_alt_outlined),
                    style: GoogleFonts.quicksand(
                      color: renk(metin_renk),
                    ),
                  ),
                ),
                Container(
                  decoration: tema.inputBoxDec(),
                  margin: EdgeInsets.only(top:5,bottom: 20,right: 30,left: 30),
                  padding: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
                  child: TextFormField(
                    obscureText: true,
                    decoration: tema.inputDec(
                        "Şifrenizi Girin",Icons.vpn_key_outlined),
                    style: GoogleFonts.quicksand(
                      color: renk(metin_renk),
                      letterSpacing: 5, //şifrelerin arasındaki uzaklık
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          renk("224ABE"),
                          renk("4E73DF"),
                        ], begin:Alignment.topRight,
                          end:Alignment.topLeft,
                        )
                    ),
                    child: Text("GİRİŞ YAP",
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 20,
                      ) ,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}