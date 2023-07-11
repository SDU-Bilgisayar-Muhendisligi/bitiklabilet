import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'bus_select.dart';

enum SortingOption {
  Saat,
  Fiyat,
}

class Otobus_Detay extends StatefulWidget {
  const Otobus_Detay({Key? key, required Map<String, dynamic> busData}) : super(key: key);

  @override
  _Otobus_DetayState createState() => _Otobus_DetayState();
}

class _Otobus_DetayState extends State<Otobus_Detay> {
  SortingOption _sortingOption = SortingOption.Saat; // Varsayılan sıralama seçeneği
  bool _isDescending = false; // Sıralama düzenini tutan değişken

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

          seferler.sort((a, b) {
            if (_sortingOption == SortingOption.Saat) {
              final DateTime tarihA = (a['tarih'] as Timestamp).toDate();
              final DateTime tarihB = (b['tarih'] as Timestamp).toDate();
              final int timeComparison = compareTimes(tarihA, tarihB);
              return _isDescending ? -timeComparison : timeComparison;
            } else {
              final double fiyatA = (a['fiyat'] ?? 0).toDouble();
              final double fiyatB = (b['fiyat'] ?? 0).toDouble();
              final int priceComparison = fiyatA.compareTo(fiyatB);
              return _isDescending ? -priceComparison : priceComparison;
            }
          });

          return Column(
            children: [
              Container(
                height: 70,
                color: Colors.red,
              ),
              Container(
                margin: EdgeInsets.all(16),
                height: 45,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_sortingOption == SortingOption.Saat) {
                              _isDescending = !_isDescending;
                            } else {
                              _sortingOption = SortingOption.Saat;
                              _isDescending = false;
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: _sortingOption == SortingOption.Saat ? Colors.red : Colors.white,
                          onPrimary: _sortingOption == SortingOption.Saat ? Colors.white : Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(_sortingOption == SortingOption.Saat
                            ? _isDescending ? 'Saate Göre Sırala' : 'Saate Göre Sırala'
                            : 'Saate Göre Sırala'),
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_sortingOption == SortingOption.Fiyat) {
                              _isDescending = !_isDescending;
                            } else {
                              _sortingOption = SortingOption.Fiyat;
                              _isDescending = false;
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: _sortingOption == SortingOption.Fiyat ? Colors.red : Colors.white,
                          onPrimary: _sortingOption == SortingOption.Fiyat ? Colors.white : Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: Text(_sortingOption == SortingOption.Fiyat
                            ? _isDescending ? 'Fiyata Göre Sırala' : 'Fiyata Göre Sırala'
                            : 'Fiyata Göre Sırala'),
                      ),
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

  int compareTimes(DateTime a, DateTime b) {
    final int hourComparison = a.hour.compareTo(b.hour);
    if (hourComparison != 0) {
      return hourComparison;
    }
    return a.minute.compareTo(b.minute);
  }
}
