import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SeferEklemeWidget extends StatefulWidget {
  @override
  _SeferEklemeWidgetState createState() => _SeferEklemeWidgetState();
}

class _SeferEklemeWidgetState extends State<SeferEklemeWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<String> getSehirler() {
    return [
  'Adana', 'Adıyaman', 'Afyonkarahisar', 'Ağrı', 'Amasya', 'Ankara', 'Antalya', 'Artvin', 'Aydın', 'Balıkesir',
  'Bilecik', 'Bingöl', 'Bitlis', 'Bolu', 'Burdur', 'Bursa', 'Çanakkale', 'Çankırı', 'Çorum', 'Denizli', 'Diyarbakır',
  'Edirne', 'Elazığ', 'Erzincan', 'Erzurum', 'Eskişehir', 'Gaziantep', 'Giresun', 'Gümüşhane', 'Hakkari', 'Hatay',
  'Isparta', 'Mersin', 'İstanbul', 'İzmir', 'Kars', 'Kastamonu', 'Kayseri', 'Kırklareli', 'Kırşehir', 'Kocaeli',
  'Konya', 'Kütahya', 'Malatya', 'Manisa', 'Kahramanmaraş', 'Mardin', 'Muğla', 'Muş', 'Nevşehir', 'Niğde', 'Ordu',
  'Rize', 'Sakarya', 'Samsun', 'Siirt', 'Sinop', 'Sivas', 'Tekirdağ', 'Tokat', 'Trabzon', 'Tunceli', 'Şanlıurfa',
  'Uşak', 'Van', 'Yozgat', 'Zonguldak', 'Aksaray', 'Bayburt', 'Karaman', 'Kırıkkale', 'Batman', 'Şırnak', 'Bartın',
  'Ardahan', 'Iğdır', 'Yalova', 'Karabük', 'Kilis', 'Osmaniye', 'Düzce',
  ];
  }
  List<String>  getFirmalar() {
    return [
      'Pamukkale',
      'Isparta Petrol Turizm',
      'Kamil Koç',
      'Sarıkız',
      'Anadolu',
      'Lüks Artvin',
    ];
  }
    String selectedFirma = '';
    DateTime? tarih;
    TimeOfDay? saat;
    int kapasite = 0;
    int fiyat = 0;
    String varisNoktasi = '';
    String kalkisNoktasi = '';

    void _seferEkle() async {
      if (selectedFirma.isEmpty ||
          tarih == null ||
          saat == null ||
          kapasite <= 0 ||
          fiyat <= 0 ||
          varisNoktasi.isEmpty ||
          kalkisNoktasi.isEmpty) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Hata'),
              content: Text('Lütfen tüm alanları doldurun.'),
              actions: [
                TextButton(
                  child: Text('Tamam'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
        return;
      }

      try {
        DateTime birlestirilmisTarihSaat = DateTime(
          tarih!.year,
          tarih!.month,
          tarih!.day,
          saat!.hour,
          saat!.minute,
        );

        Timestamp tarihTimestamp = Timestamp.fromMillisecondsSinceEpoch(
          birlestirilmisTarihSaat.millisecondsSinceEpoch,
        );

        await _firestore.collection('Seferler').add({
          'firma': selectedFirma,
          'tarih': tarihTimestamp,
          'kapasite': kapasite,
          'fiyat': fiyat,
          'varisNoktasi': varisNoktasi,
          'kalkisNoktasi': kalkisNoktasi,
        });

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Başarılı'),
              content: Text('Sefer başarıyla eklendi.'),
              actions: [
                TextButton(
                  child: Text('Tamam'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );

        setState(() {
          selectedFirma = '';
          tarih = null;
          saat = null;
          kapasite = 0;
          fiyat = 0;
          varisNoktasi = '';
          kalkisNoktasi = '';
        });
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Hata'),
              content: Text('Sefer eklenirken bir hata oluştu. Hata: $e'),
              actions: [
                TextButton(
                  child: Text('Tamam'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    }

    Future<void> _selectDate(BuildContext context) async {
      DatePicker.showDatePicker(
        context,
        showTitleActions: true,
        minTime: DateTime.now(), // Geçmiş zamanın seçilmesini engeller
        maxTime: DateTime.now().add(Duration(days: 150)), // Sadece 30 gün ileriye kadar seçim yapılmasını sağlar
        onConfirm: (date) {
          setState(() {
            tarih = date;
          });
        },
        currentTime: DateTime.now(),
        locale: LocaleType.tr,
      );
    }

    Future<void> _selectTime(BuildContext context) async {
      DatePicker.showTimePicker(
        context,
        showSecondsColumn: false, // Saniye sütununu gizler
        showTitleActions: true,
        onConfirm: (time) {
          setState(() {
            saat = TimeOfDay.fromDateTime(time);
          });
        },
        currentTime: DateTime.now(),
        locale: LocaleType.tr,
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sefer Ekleme'),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Firma'),
                value: selectedFirma.isNotEmpty ? selectedFirma : null,
                items: getFirmalar().map((firma) {
                  return DropdownMenuItem<String>(
                    value: firma,
                    child: Text(firma),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedFirma = value!;
                  });
                },
                iconSize: 24,
                icon: Icon(Icons.arrow_drop_down),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Varış Noktası'),
                value: varisNoktasi.isNotEmpty ? varisNoktasi : null,
                items: getSehirler().map((sehir) {
                  return DropdownMenuItem<String>(
                    value: sehir,
                    child: Text(sehir),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    varisNoktasi = value!;
                  });
                },
                iconSize: 24,
                icon: Icon(Icons.arrow_drop_down),
              ),
              SizedBox(height: 8),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Kalkış Noktası'),
                value: kalkisNoktasi.isNotEmpty ? kalkisNoktasi : null,
                items: getSehirler().map((sehir) {
                  return DropdownMenuItem<String>(
                    value: sehir,
                    child: Text(sehir),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    kalkisNoktasi = value!;
                  });
                },
                iconSize: 24,
                icon: Icon(Icons.arrow_drop_down),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // İstenilen rengi burada belirtebilirsiniz
                ),
                child: Text('Tarih Seç'),
              )
              ,
              if (tarih != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('Tarih: ${tarih!.day}/${tarih!.month}/${tarih!.year}'),
                ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => _selectTime(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // İstenilen rengi burada belirtebilirsiniz
                ),
                child: Text('Saat Seç'),
              ),

              if (saat != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text('Saat: ${saat!.hour}:${saat!.minute}'),
                ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: 'Kapasite'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    kapasite = int.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(labelText: 'Fiyat'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    fiyat = int.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: _seferEkle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // İstenilen rengi burada belirtebilirsiniz
                ),
                child: Text('Sefer Oluştur'),
              ),

            ],
          ),
        ),
      );
    }
  }

