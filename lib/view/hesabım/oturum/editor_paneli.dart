import 'package:bitiklabilet/view/hesab%C4%B1m/oturum/sefer_ekleme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bitiklabilet/components/riverpod/bottom_nav_bar_riverpod.dart';





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
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
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
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(top: 10, bottom: 10, right: 40, left: 40),
                      ),

                    ),
                    child: Text(
                      "Sefer Güncelleme",
                      style: GoogleFonts.quicksand(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.white,
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.only(top: 10, bottom: 10, right: 67, left: 67),
                      ),
                    ),
                    child: Text(
                      "Sefer Silme",
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




