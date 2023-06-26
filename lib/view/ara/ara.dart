import 'package:bitiklabilet/view/ara/busfilter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Ara extends StatefulWidget {
  Ara({Key? key}) : super(key: key);

  @override
  _AraState createState() => _AraState();
}

class _AraState extends State<Ara>{
  bool tripType=false;
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        Text(
          "bitiklabilet dünyamıza",
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text("hoşgeldiniz",
        style: GoogleFonts.montserrat(
          fontSize:24,
          fontWeight: FontWeight.bold,
        ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 32),
            height: 64,
            width: MediaQuery.of(context).size.width-160,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(32)
            ),
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
            child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                          onTap: (){
                            setState((){
                             tripType = true;
                      });
                    },
                        child: tripType
                          ? Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(32)
                          ),
                          child:const Center(
                            child: Text("Gidiş",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                            :const Center(
                          child: Text("Gidiş",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ),
                  ),
                         Expanded(
                             child: GestureDetector(
                               onTap: (){
                                 setState(() {
                                   tripType =false;
                               });
                              },
                               child: !tripType
                                 ? Container(
                                 decoration: BoxDecoration(
                                   color: Colors.red,
                                   borderRadius: BorderRadius.circular(32)
                                 ),
                                   child:const Center(
                                     child: Text("Gidiş-Dönüş",
                                     style: TextStyle(
                                       fontSize: 16,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.white,
                                     ),
                                     ),
                                   ),
                               )
                                   :const Center(
                                       child: Text("Gidiş-Dönüş",
                                         style: TextStyle(
                                           fontSize: 16,
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white,
                                         ),
                                       ),
                               ),
                             )
              ),
            ],
          ),
        ),
        ),

        Container(
          margin: EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4
          ),
          child: Row(
            children: [
              Text("Nereden",
              style: TextStyle(
              fontSize: 16,
              )
              ),
              Expanded(
                  child: TextField(
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                  )
              )
              ),
            ],
          ),
        ),
         Container(
           margin: EdgeInsets.only(bottom: 8),
           decoration: BoxDecoration(
               border: Border.all(),
               borderRadius: BorderRadius.circular(6)),
           padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4
           ),
           child: Row(
             children: const [
               Text("Nereye",
                   style: TextStyle(
                     fontSize: 16,
                   )
               ),
               SizedBox(width: 14),
               Expanded(
                   child: TextField(
                       style: TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                       ),
                       decoration: InputDecoration(
                         border: InputBorder.none,
                       )
                   )
               ),
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 24),
            child:Row(
               children: [
                 Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:const [
                       Text('Date',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 16,
                           color: Colors.grey,
                       ),
                 ),
                      SizedBox(height: 16,),
               ],
             ),
             ),
             Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children:const [
                 Text('Returning',
                   style: TextStyle(
                     fontSize: 16,
                     fontWeight: FontWeight.bold,
                     color: Colors.grey,
                   ),
                 ),
                 SizedBox(height: 16),
                 Text("Set date",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 16,
                 ),
                 ),
               ],
             ),
                 )
                 ],
           ),
         ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                 Text("Yolcular",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 18,
                     color: Colors.grey,
                   ),
                 ),
                 Container(
                  height: 42,
                   decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(
                      color: Colors.red,
                      width: 1.5
                     )
                  ),
                     child: Row(
                         children: [
                         IconButton(onPressed: (){} , icon: Icon(Icons.remove)),
                        Text("1",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                        IconButton(onPressed: (){} ,
                            icon: Icon(Icons.add,
                            ),
                        ),
                 ],
               ),
             )
           ],
         ),
         SizedBox(height: 35),
         Container(
           decoration: BoxDecoration(
             color: Colors.green,
             borderRadius: BorderRadius.circular(40),
           ),
           padding: EdgeInsets.symmetric(vertical: 20),
           child:Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("Otobüs Bileti Bul")
             ],
           ) ,
         )
      ],

    ),
    );
  }
}


























