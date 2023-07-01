import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class SeferEklemeWidget extends StatefulWidget {
  @override
  _SeferEklemeWidgetState createState() => _SeferEklemeWidgetState();
}

class _SeferEklemeWidgetState extends State<SeferEklemeWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String firma = '';
  DateTime? tarih;
  TimeOfDay? saat;
  int kapasite = 0;

  void _seferEkle() async {
    if (firma.isEmpty || tarih == null || saat == null || kapasite <= 0) {
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
    'firma': firma,
    'tarih': tarihTimestamp,
    'kapasite': kapasite,
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
    firma = '';
    tarih = null;
    saat = null;
    kapasite = 0;
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(labelText: 'Firma'),
              onChanged: (value) {
                setState(() {
                  firma = value;
                });
              },
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: Text('Tarih Seç'),
            ),
            if (tarih != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('Tarih: ${tarih!.day}/${tarih!.month}/${tarih!.year}'),
              ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _selectTime(context),
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
            ElevatedButton(
              onPressed: _seferEkle,
              child: Text('Sefer Oluştur'),
            ),
          ],
        ),
      ),
    );
  }
}
