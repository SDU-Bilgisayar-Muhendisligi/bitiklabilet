import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../sabitler/ext.dart';

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
          title: Text("Seyahatlerim"),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                  margin:EdgeInsets.only(top: 50),
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
              InkWell(
                child: Container(
                  margin: EdgeInsets.only(top:25,bottom: 25),
                  padding: EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                      color: renk("03BB85"),
                      ),
                  child: Text("ÜYE GİRİŞİ YAP",
                    style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),

          ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                InkWell(
                     child: Container(
                       margin: EdgeInsets.only(top:25,bottom: 25),
                       padding: EdgeInsets.all(10),
                       decoration:  BoxDecoration(
                       border: Border.all(
                         color: renk("03BB85"),
                       )
                      ),
                         child: Text("SEYAHAT SORGULA",
                          style: GoogleFonts.notoSans(
                          color: renk("03BB85"),
                          fontSize: 20,
        ),
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
