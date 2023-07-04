import 'package:bitiklabilet/view/ara/bus_select.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Otobus_Detay extends StatefulWidget{
  final String selectedNereden;

 Otobus_Detay({Key? key, required this.selectedNereden}) : super(key:key);

  @override
  _Otobus_DetayState createState() => _Otobus_DetayState();

}

class _Otobus_DetayState extends State<Otobus_Detay> {
  late String _selectedNereden;

  @override
  void initState() {
    super.initState();
    _selectedNereden = widget.selectedNereden;
  }


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
  List<String> _selectedBusCompanies= [];

  bool _selectAll = false;

  void _toggleSelectAll(){
    setState(() {
      if(_selectAll){
        _selectedBusCompanies.clear();
      } else{
        _selectedBusCompanies = List.from(busCompanies);
      }
      _selectAll = !_selectAll;
    });
  }

  void _toggleCompany(String company){
    setState(() {
      if(_selectedBusCompanies.contains(company)){
        _selectedBusCompanies.remove(company);
      } else{
        _selectedBusCompanies.add(company);
      }
      _selectAll=false;
    });
  }
  List<String> _selectedTimeSlots = [];

  void _toggleTimeSlot(String timeSlot) {
    if (_selectedTimeSlots.contains(timeSlot)) {
      setState(() {
        _selectedTimeSlots.remove(timeSlot);
      });
    } else {
      setState(() {
        _selectedTimeSlots.add(timeSlot);
      });
    }
  }


  List<String> timeSlots = [
    "Sabaha Karsi (00.00 - 05.00)",
    "Sabah (05.00 - 12.00 arasi)",
    "Oglen (12.00 - 17.00 arasi)",
    "Gece (22.00 - sonraki gun 05.00 arasi)"
  ];
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
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () => _toggleSelectAll(),
                                            child: Text(_selectAll ? 'Seçilenleri Kaldır' : 'Tümünü Seç'),
                                          ),
                                          TextButton(
                                            onPressed: () => setState(() => _selectedBusCompanies.clear()),
                                            child: Text('Filtrele'),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: busCompanies.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return CheckboxListTile(
                                              title: Text(busCompanies[index]),
                                              value: _selectedBusCompanies.contains(busCompanies[index]),
                                              onChanged:(bool? value) {
                                                if (value != null) {
                                                  _toggleCompany(busCompanies[index]);
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: timeSlots.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return CheckboxListTile(
                                              title: Text(timeSlots[index]),
                                              value: _selectedTimeSlots.contains(timeSlots[index]),
                                              onChanged:(bool? value) {
                                                if (value != null) {
                                                  _toggleTimeSlot(timeSlots[index]);
                                                }
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                        ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                Padding(
                                    padding: const EdgeInsets
                                        .symmetric(vertical: 4)),
                                Text(_selectedNereden,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.pink,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
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
                                Padding(
                                    padding: const EdgeInsets.symmetric(
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
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(context,
                                      MaterialPageRoute(
                                          builder: (context) => Otobus_Hazirlama()),
                                    );
                                    },
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red,
                                  ),
                                    padding: MaterialStateProperty.all<EdgeInsets>(
                                      EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
                    padding: EdgeInsets.all(50),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                          Padding(
                              padding: const EdgeInsets
                                  .symmetric(
                                  vertical: 4)),
                          Text(_selectedNereden,
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
