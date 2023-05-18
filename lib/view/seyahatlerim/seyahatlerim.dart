import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../sabitler/ext.dart';
import '../hesabım/oturum/giris.dart';

class Seyahatlerim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppBar Örneği',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("Geçmiş Seferlerim"),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                  margin:EdgeInsets.only(top: 50,bottom:50),
                  child: Text(
                    "Sistemde kayıtlı bilet detaylarına ulaşmak ve işlem yapabilmek için"
                        " Üye Girişi yapmanız gerekmektedir.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.robotoSlab(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  )
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GirisSayfasi()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    renk("03BB85"),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.only(top: 15,bottom: 15,right: 35,left: 35),
                  ),
                ),
                child: Text(
                  "ÜYE GİRİŞİ YAP",
                  style: GoogleFonts.quicksand(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('veya'),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white,
                  ),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.only(top: 15,bottom: 15,right: 35,left: 35),
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(
                      width:2,
                      color: renk("03BB85"),
                    ),
                  ),
                ),
                child: Text(
                  "SEYAHAT SORGULA",
                  style: GoogleFonts.quicksand(
                      color: renk("03BB85"),
                      fontSize: 18,
                      fontWeight: FontWeight.bold
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

