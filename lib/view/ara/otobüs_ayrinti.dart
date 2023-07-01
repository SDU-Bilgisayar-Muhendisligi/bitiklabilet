import 'package:bitiklabilet/view/ara/bus_select.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Otobus_Detay extends StatefulWidget{
  const Otobus_Detay({Key? key}) : super(key:key);

  @override
  State<Otobus_Detay> createState() => _Otobus_DetayState();
}

class _Otobus_DetayState extends State<Otobus_Detay> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(''),
      ),
      body: Column(
        children: [
          Container(
            height: 70,
            color: Colors.red,
          ),
          Container(
            margin:EdgeInsets.all(16),
            height: 45,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: Colors.grey.shade500,
              )
            ),
            child: Row(
              children: [
                IconButton(onPressed: (){}, icon:const Icon(Icons.tune,
                ),
                ),
                const Text("Filtre")
              ],
            ),
          ),
          const Divider(),
          Expanded(
              child: SingleChildScrollView(
                child: Column(
                children: [
                  Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:const [
                              Text("Kalkış",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text("10:30",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),),
                              Padding(padding: const EdgeInsets.symmetric(vertical: 4)),
                              Text("istanbul",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children:const [
                              Text("Varış",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text("13:30",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Padding(padding: const EdgeInsets.symmetric(vertical: 4)),
                              Text("Kocaeli",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)
                            ),
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Otobus_Hazirlama( )),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                    Colors.red,
                                  ),
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                  ),
                                ),
                                child: Text("120 TL",
                                  style: GoogleFonts.quicksand(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],

                      ),

                    ],
                  ),
                ),
                  Divider(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:const [
                                Text("Kalkış",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text("10:30",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),),
                                Padding(padding: const EdgeInsets.symmetric(vertical: 4)),
                                Text("istanbul",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children:const [
                                Text("Varış",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text("13:30",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(padding: const EdgeInsets.symmetric(vertical: 4)),
                                Text("Kocaeli",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Otobus_Hazirlama( )),
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.red,
                                    ),
                                    padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                    ),
                                  ),
                                  child: Text("120 TL",
                                    style: GoogleFonts.quicksand(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:const [
                                Text("Kalkış",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text("10:30",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),),
                                Padding(padding: const EdgeInsets.symmetric(vertical: 4)),
                                Text("istanbul",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children:const [
                                Text("Varış",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text("13:30",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(padding: const EdgeInsets.symmetric(vertical: 4)),
                                Text("Kocaeli",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Otobus_Hazirlama( )),
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.red,
                                    ),
                                    padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                    ),
                                  ),
                                  child: Text("120 TL",
                                    style: GoogleFonts.quicksand(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                    ),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:const [
                                Text("Kalkış",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text("10:30",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),),
                                Padding(padding: const EdgeInsets.symmetric(vertical: 4)),
                                Text("istanbul",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children:const [
                                Text("Varış",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text("13:30",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Padding(padding: const EdgeInsets.symmetric(vertical: 4)),
                                Text("Kocaeli",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Otobus_Hazirlama( )),
                                    );
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      Colors.red,
                                    ),
                                    padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                                    ),
                                  ),
                                  child: Text("120 TL",
                                    style: GoogleFonts.quicksand(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),
              ],
            ),
          )
          ),
        ],
      ),
    );
}
}