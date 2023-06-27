import 'package:bitiklabilet/view/ara/otobüs_ayrinti.dart';
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
  int _counter=0;
  TextEditingController _neredenTec=TextEditingController();
  TextEditingController _nereyeTec=TextEditingController();
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child:SingleChildScrollView(
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
           height: 140,
           child: Stack(
             children: [
               Positioned(
                 left:0,
                 right: 0,
                 bottom: 0,
                 top: 0,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
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
                               controller: _neredenTec,
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
                         borderRadius: BorderRadius.circular(6)
                     ),
                     padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4
                     ),
                     child: Row(
                       children: [
                         Text("Nereye",
                             style: TextStyle(
                               fontSize: 16,
                             )
                         ),
                         SizedBox(width: 14),
                         Expanded(
                             child: TextField(
                               controller: _nereyeTec,
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
                 ],
               )
               ),
               Positioned(
                 right: 16,
                   bottom: 16,
                   top: 16,
                   child: GestureDetector(
                     onTap: (){
                       setState(() {
                         final tmpText=_neredenTec.text;
                         _neredenTec.text=_nereyeTec.text;
                         _nereyeTec.text=tmpText;
                       });
                       },
                   child:const Center(
                   child: CircleAvatar(
                     radius: 32,
                     backgroundColor: Colors.red,
                     foregroundColor: Colors.white,
                     child: Icon(
                       Icons.sync,
                     ),
                   ),
               ),
               ),
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
                 const Text("Yolcular",
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
                         IconButton(
                             onPressed: (){
                               _counter--;
                               if(_counter<=1) _counter=1;
                               setState(() {

                               });
                             } ,
                             icon: Icon(Icons.remove,
                             color: _counter==1 ? Colors.grey : Colors.black,
                             )),
                        Text("$_counter",
                          style:const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                        IconButton(onPressed: (){
                          setState(() {
                            _counter++;
                          });
                        } ,
                            icon: Icon(Icons.add,
                            ),
                        ),
                 ],
               ),
             )
           ],
         ),
         SizedBox(height: 30),
         Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
             onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => Otobus_Detay( )),
             );
             },
             style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all<Color>(
               Colors.green.shade400,
             ),
             padding: MaterialStateProperty.all<EdgeInsets>(
               EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
             ),
             ),
               child: Text("Otobüs Bileti Bul",
             style: GoogleFonts.quicksand(
               color: Colors.white,
               fontSize: 18,
               fontWeight: FontWeight.w600,
             ),
           ),
         ),
         ]
          ),
         ),
         SizedBox(height: 20),
         Text("Kesintisiz İade Hakkı ve 0 Komisyon",
         style: TextStyle(
           color: Colors.grey[500]
         ),)
      ],

    ),
      ),
    );

  }

}


























