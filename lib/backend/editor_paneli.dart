import 'package:bitiklabilet/backend/sefer_ekleme.dart';
import 'package:bitiklabilet/backend/seferler.dart';
import 'package:bitiklabilet/backend/cikis.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view/hesabım/oturum/ilk_oturum.dart';






class EditorPaneli extends StatefulWidget {
  const EditorPaneli({Key? key}) : super(key: key);


  @override
  State<EditorPaneli> createState() => _EditorState();

}
class _EditorState extends State<EditorPaneli> {
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,


        home: Scaffold(


          appBar: AppBar(

            title: Text('Editör Sayfası'),
            backgroundColor: Colors.red,
            centerTitle: true,
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SeferEklemeWidget())
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(top: 10, bottom: 10, right: 59, left: 59),
                      ),
                    ),
                    child: Text(
                      "Sefer Ekleme",
                      style: GoogleFonts.quicksand(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),



                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Seferler())
                      );


                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(top: 10, bottom: 10, right: 81, left: 81),
                      ),
                    ),
                    child: Text(
                      "Seferler",
                      style: GoogleFonts.quicksand(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => oturumcikis()),
                      );

                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(top:10 ,bottom: 10,right: 77,left: 77),
                      ),
                    ),
                    child: Text("Çıkış Yap",
                      style: GoogleFonts.quicksand(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),


                ],
              ),
            ],
          ),




        ),


    );


  }


}




