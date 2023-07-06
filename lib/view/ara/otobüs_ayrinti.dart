import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'bus_select.dart';

enum SortingOption {
  Saat, // Saate göre sıralama
  Fiyat, // Fiyata göre sıralama
}

class Otobus_Detay extends StatefulWidget {
  const Otobus_Detay({Key? key, required Map<String, dynamic> busData}) : super(key: key);

  @override
  _Otobus_DetayState createState() => _Otobus_DetayState();
}

class _Otobus_DetayState extends State<Otobus_Detay> {

  SortingOption _sortingOption = SortingOption.Saat; // Varsayılan sıralama seçeneği

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(''),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Seferler').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Bir hata oluştu: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          var seferler = snapshot.data?.docs ?? [];

          int compareTimes(DateTime a, DateTime b) {
            final int hourComparison = a.hour.compareTo(b.hour);
            if (hourComparison != 0) {
              return hourComparison;
            }

            return a.minute.compareTo(b.minute);
          }

          // Seferleri sırala
          seferler.sort((a, b) {
            if (_sortingOption == SortingOption.Saat) {
              final DateTime tarihA = (a['tarih'] as Timestamp).toDate();
              final DateTime tarihB = (b['tarih'] as Timestamp).toDate();
              return compareTimes(tarihA, tarihB);
            } else {
              final double fiyatA = (a['fiyat'] ?? 0).toDouble();
              final double fiyatB = (b['fiyat'] ?? 0).toDouble();
              return fiyatA.compareTo(fiyatB);
            }
          });





          if (_sortingOption == SortingOption.Saat) {
            seferler = seferler.reversed.toList();
          } else {
            seferler = seferler.toList();
          }

          return Column(
            children: [
              Container(
                height: 70,
                color: Colors.red,
              ),
              Container(
                margin: EdgeInsets.all(16),
                height: 45,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: Colors.grey.shade400,
                    width: 1,
                  ),
                ),
                child: PopupMenuButton<SortingOption>(
                  icon: Icon(Icons.filter_list),
                  onSelected: (SortingOption result) {
                    setState(() {
                      _sortingOption = result;
                    });
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<SortingOption>>[
                    const PopupMenuItem<SortingOption>(
                      value: SortingOption.Saat,
                      child: Text('Saate Göre Sırala'),
                    ),
                    const PopupMenuItem<SortingOption>(
                      value: SortingOption.Fiyat,
                      child: Text('Fiyata Göre Sırala'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: seferler.map((QueryDocumentSnapshot document) {
                      Map<String, dynamic> sefer = document.data() as Map<String, dynamic>;
                      return Card(
                        elevation: 2,
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Kalkış: ${sefer['kalkisNoktasi'] ?? ''}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Varış: ${sefer['varisNoktasi'] ?? ''}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Firma: ${sefer['firma'] ?? ''}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Tarih: ${DateFormat('dd.MM.yyyy').format(sefer['tarih'].toDate()) ?? ''}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "Saat: ${DateFormat('HH:mm').format(sefer['tarih'].toDate()) ?? ''}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 16),
                              Container(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Otobus_Hazirlama()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red,
                                    padding: EdgeInsets.all(12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Text(
                                    "${sefer['fiyat']} TL",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}