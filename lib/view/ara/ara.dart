import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Ara extends StatefulWidget {
  Ara({Key? key}) : super(key: key);

  @override
  _AraState createState() => _AraState();
}

class _AraState extends State<Ara> {
  List<String> _ilSecenekleri= [      'Adana',      'Adıyaman',      'Afyonkarahisar',      'Ağrı',      'Amasya',      'Ankara',      'Antalya',      'Artvin',      'Aydın',      'Balıkesir',      'Bilecik',      'Bingöl',      'Bitlis',      'Bolu',      'Burdur',      'Bursa',      'Çanakkale',      'Çankırı',      'Çorum',      'Denizli',      'Diyarbakır',      'Edirne',      'Elazığ',      'Erzincan',      'Erzurum',      'Eskişehir',      'Gaziantep',      'Giresun',      'Gümüşhane',      'Hakkari',      'Hatay',      'Isparta',      'Mersin',      'İstanbul',      'İzmir',      'Kars',      'Kastamonu',      'Kayseri',      'Kırklareli',      'Kırşehir',      'Kocaeli',      'Konya',      'Kütahya',      'Malatya',      'Manisa',      'Kahramanmaraş',      'Mardin',      'Muğla',      'Muş',      'Nevşehir',      'Niğde',      'Ordu',      'Rize',      'Sakarya',      'Samsun',      'Siirt',      'Sinop',      'Sivas',      'Tekirdağ',      'Tokat',      'Trabzon',      'Tunceli',      'Şanlıurfa',      'Uşak',      'Van',      'Yozgat',      'Zonguldak',      'Aksaray',      'Bayburt',      'Karaman',      'Kırıkkale',      'Batman',      'Şırnak',      'Bartın',      'Ardahan',      'Iğdır',      'Yalova',      'Karabük',      'Kilis',      'Osmaniye',      'Düzce'    ];

  String? selectedIl;
  String? selectedIl0;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitıklabilet'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 0),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [


                  DropdownButton<String>(
                            hint: Text('Nereden'),
                    value: selectedIl,
                    items: _ilSecenekleri.map((il) {
                      return DropdownMenuItem<String>(
                        value: il,
                        child: Text(il),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedIl = value;
                      });
                    },
                  )

              ],
            ),
            SizedBox(height: 25),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                  hint: Text('Nereye'),
                  value: selectedIl0,
                  items: _ilSecenekleri.map((il) {
                    return DropdownMenuItem<String>(
                      value: il,
                      child: Text(il),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedIl0 = value;
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2100),
                    );

                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1F9B78)
                  ),
                  child: Text(
                    selectedDate != null
                        ? DateFormat('    dd/MM/yyyy    ').format(selectedDate!)
                        : 'Seyehat Tarihi Seç',
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1F9B78), // #1F9B78 renk tonu
                  ),
                  child: Text('      Otobüs Bileti Bul      '),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
























