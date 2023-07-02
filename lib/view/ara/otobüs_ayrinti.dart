import 'package:bitiklabilet/view/ara/bus_select.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Otobus_Detay extends StatefulWidget{
  const Otobus_Detay({Key? key}) : super(key:key);

  @override
  State<Otobus_Detay> createState() => _Otobus_DetayState();

}

class _Otobus_DetayState extends State<Otobus_Detay> {
  bool _tumunuSecildi = false;
  List<String> _secilenFirmalar = [];
  List<String> busCompanies = [
    "Ayar Aydın Seyahat",
    "Anadolu Ulaşım Turizm",
    "Balıkesir Haksar Turizm",
    "Buzlu Turizm",
    "İstanbul Kalesi",
    "Kamil Koç",
    "Kale Seyahat",
    "Metro Turizm",
    "Pamukkale Turizm",
    "Villa Seyahat",
    "Varan Turizm"
  ];

  void _tumunuSec() {
    setState(() {
      _tumunuSecildi = !_tumunuSecildi;
      if (_tumunuSecildi) {
        _secilenFirmalar = List.generate(10, (index) => 'Firma $index');
      } else {
        _secilenFirmalar.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title:Text(""),
      backgroundColor: Colors.red,
    ),
      body:Column(
        children: [
           ElevatedButton(
             child: Text('FİLTRE'),
             style: ElevatedButton.styleFrom(
          primary: Colors.red,
        ),
              onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        color:Colors.red,
                        child: Text("FİLTRE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),),
                      ),
                      Expanded(
                        child: DefaultTabController(
                            length: 2,
                            child: Column(
                              children: [
                                TabBar(
                                  tabs: [
                                    Tab(child:
                                    Text('Firmaya Göre',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),),
                                    ),
                                    Tab(child:
                                    Text('Saate Göre',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      ListView.builder(
                                        itemCount: 10,
                                        itemBuilder: (BuildContext context, int index) {
                                          return ListTile(
                                            title: Text(busCompanies[index]),
                                            trailing: Checkbox(
                                              value: _secilenFirmalar.contains(index),
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  if (value == true) {
                                                    _secilenFirmalar.add(index as String);
                                                  } else {
                                                    _secilenFirmalar.remove(index);
                                                  }
                                                });
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                      Center(child: Text('Saate Göre')),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text("Filtrele"),
                            ),
                            ElevatedButton(
                              onPressed: _tumunuSec,
                              child: Text(_tumunuSecildi? 'Tümünü Kaldır' : 'Tümünü Seç'),
                            ),
                          ]
                      ),
                    ],
                );
              },
          );
        },
      ),
          Divider(),
          Expanded(
          child: SingleChildScrollView(
          child: Column(
          children: [
           Container(
          decoration: BoxDecoration(
          color: Colors.grey[200],
          ),
          padding: EdgeInsets.all(50),
          child: Column(
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween,
          children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment
              .start,
          children: const [
          Text("Kalkış",
          style: TextStyle(
          fontSize: 16,
          ),
          ),
          Text("10:30",
          style: TextStyle(
    fontWeight: FontWeight
        .bold,
    fontSize: 20,
    ),),
    Padding(
    padding: const EdgeInsets
        .symmetric(
    vertical: 4)),
    Text("istanbul",
    style: TextStyle(
    fontSize: 16,
    ),
    ),
    ],
    ),
    Column(
    crossAxisAlignment: CrossAxisAlignment
        .end,
    children: const [
    Text("Varış",
    style: TextStyle(
    fontSize: 16,
    ),
    ),
    Text("13:30",
    style: TextStyle(
    fontWeight: FontWeight
        .bold,
    fontSize: 20,
    ),
    ),
    Padding(
    padding: const EdgeInsets
        .symmetric(
    vertical: 4)),
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
    borderRadius: BorderRadius
        .circular(20)
    ),
    padding: EdgeInsets
        .symmetric(
    vertical: 10),
    child: Center(
    child: ElevatedButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (
    context) =>
    Otobus_Hazirlama()),
    );
    },
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty
        .all<
    Color>(
    Colors.red,
    ),
    padding: MaterialStateProperty
        .all<EdgeInsets>(
    EdgeInsets.only(
    left: 10,
    right: 10,
    top: 10,
    bottom: 10),
    ),
    ),
    child: Text("120 TL",
    style: GoogleFonts
        .quicksand(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight
        .w600,
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
              padding: EdgeInsets.all(50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start,
                        children: const [
                          Text("Kalkış",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text("10:30",
                            style: TextStyle(
                              fontWeight: FontWeight
                                  .bold,
                              fontSize: 20,
                            ),),
                          Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  vertical: 4)),
                          Text("istanbul",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .end,
                        children: const [
                          Text("Varış",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text("13:30",
                            style: TextStyle(
                              fontWeight: FontWeight
                                  .bold,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  vertical: 4)),
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
                            borderRadius: BorderRadius
                                .circular(20)
                        ),
                        padding: EdgeInsets
                            .symmetric(
                            vertical: 10),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) =>
                                        Otobus_Hazirlama()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .all<
                                  Color>(
                                Colors.red,
                              ),
                              padding: MaterialStateProperty
                                  .all<EdgeInsets>(
                                EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 10,
                                    bottom: 10),
                              ),
                            ),
                            child: Text("120 TL",
                              style: GoogleFonts
                                  .quicksand(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight
                                    .w600,
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
              padding: EdgeInsets.all(50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start,
                        children: const [
                          Text("Kalkış",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text("10:30",
                            style: TextStyle(
                              fontWeight: FontWeight
                                  .bold,
                              fontSize: 20,
                            ),),
                          Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  vertical: 4)),
                          Text("istanbul",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .end,
                        children: const [
                          Text("Varış",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text("13:30",
                            style: TextStyle(
                              fontWeight: FontWeight
                                  .bold,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  vertical: 4)),
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
                            borderRadius: BorderRadius
                                .circular(20)
                        ),
                        padding: EdgeInsets
                            .symmetric(
                            vertical: 10),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) =>
                                        Otobus_Hazirlama()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .all<
                                  Color>(
                                Colors.red,
                              ),
                              padding: MaterialStateProperty
                                  .all<EdgeInsets>(
                                EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 10,
                                    bottom: 10),
                              ),
                            ),
                            child: Text("120 TL",
                              style: GoogleFonts
                                  .quicksand(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight
                                    .w600,
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
              padding: EdgeInsets.all(50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start,
                        children: const [
                          Text("Kalkış",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text("10:30",
                            style: TextStyle(
                              fontWeight: FontWeight
                                  .bold,
                              fontSize: 20,
                            ),),
                          Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  vertical: 4)),
                          Text("istanbul",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .end,
                        children: const [
                          Text("Varış",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text("13:30",
                            style: TextStyle(
                              fontWeight: FontWeight
                                  .bold,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  vertical: 4)),
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
                            borderRadius: BorderRadius
                                .circular(20)
                        ),
                        padding: EdgeInsets
                            .symmetric(
                            vertical: 10),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) =>
                                        Otobus_Hazirlama()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .all<
                                  Color>(
                                Colors.red,
                              ),
                              padding: MaterialStateProperty
                                  .all<EdgeInsets>(
                                EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 10,
                                    bottom: 10),
                              ),
                            ),
                            child: Text("120 TL",
                              style: GoogleFonts
                                  .quicksand(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight
                                    .w600,
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
              padding: EdgeInsets.all(50),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start,
                        children: const [
                          Text("Kalkış",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text("10:30",
                            style: TextStyle(
                              fontWeight: FontWeight
                                  .bold,
                              fontSize: 20,
                            ),),
                          Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  vertical: 4)),
                          Text("istanbul",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .end,
                        children: const [
                          Text("Varış",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text("13:30",
                            style: TextStyle(
                              fontWeight: FontWeight
                                  .bold,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  vertical: 4)),
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
                            borderRadius: BorderRadius
                                .circular(20)
                        ),
                        padding: EdgeInsets
                            .symmetric(
                            vertical: 10),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (
                                        context) =>
                                        Otobus_Hazirlama()),
                              );
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .all<
                                  Color>(
                                Colors.red,
                              ),
                              padding: MaterialStateProperty
                                  .all<EdgeInsets>(
                                EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 10,
                                    bottom: 10),
                              ),
                            ),
                            child: Text("120 TL",
                              style: GoogleFonts
                                  .quicksand(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight
                                    .w600,
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
      ],
      ),
    ),
    ),
    ],
      ),
    );
  }
}
