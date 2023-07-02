import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';



class Seferler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seferler'),
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Seferler').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<QueryDocumentSnapshot> seferler = snapshot.data!.docs;

          return ListView.builder(
            itemCount: seferler.length,
            itemBuilder: (context, index) {
              var sefer = seferler[index].data() as Map<String, dynamic>;

              Timestamp tarihTimestamp = sefer['tarih'] as Timestamp;
              DateTime tarih = tarihTimestamp.toDate();

              return ListTile(
                title: Text('Firma: ${sefer['firma']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Varış Noktası: ${sefer['varisNoktasi']}'),
                    Text('Kalkış Noktası: ${sefer['kalkisNoktasi']}'),
                    Text('Tarih: ${tarih.day}/${tarih.month}/${tarih.year}'),
                    Text('Saat: ${tarih.hour}:${tarih.minute}'),
                    Text('Kapasite: ${sefer['kapasite']}'),
                    Text('Fiyat: ${sefer['fiyat']}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        _editSefer(context, seferler[index].reference);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        _deleteSefer(context, seferler[index].reference);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _editSefer(BuildContext context, DocumentReference seferRef) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SeferDuzenlemeWidget(seferRef: seferRef)),
    );
  }

  void _deleteSefer(BuildContext context, DocumentReference seferRef) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Sefer Sil'),
          content: Text('Bu seferi silmek istediğinizden emin misiniz?'),
          actions: [
            TextButton(
              child: Text(
                'İptal',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text(
                'Sil',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () async {
                await seferRef.delete();
                Navigator.pop(context);
              },
            ),

          ],
        );
      },
    );
  }
}

class SeferDuzenlemeWidget extends StatefulWidget {
  final DocumentReference seferRef;

  const SeferDuzenlemeWidget({required this.seferRef});

  @override
  _SeferDuzenlemeWidgetState createState() => _SeferDuzenlemeWidgetState();
}

class _SeferDuzenlemeWidgetState extends State<SeferDuzenlemeWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firmaController = TextEditingController();
  TextEditingController _varisNoktasiController = TextEditingController();
  TextEditingController _kalkisNoktasiController = TextEditingController();
  TextEditingController _tarihController = TextEditingController();
  TextEditingController _kapasiteController = TextEditingController();
  TextEditingController _fiyatController = TextEditingController();

  @override
  void dispose() {
    _firmaController.dispose();
    _varisNoktasiController.dispose();
    _kalkisNoktasiController.dispose();
    _tarihController.dispose();
    _kapasiteController.dispose();
    _fiyatController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchSeferDetails();
  }

  void _fetchSeferDetails() {
    widget.seferRef.get().then((snapshot) {
      var sefer = snapshot.data() as Map<String, dynamic>;
      _firmaController.text = sefer['firma'];
      _varisNoktasiController.text = sefer['varisNoktasi'];
      _kalkisNoktasiController.text = sefer['kalkisNoktasi'];

      Timestamp tarihTimestamp = sefer['tarih'] as Timestamp;
      DateTime tarih = tarihTimestamp.toDate();
      _tarihController.text = '${tarih.day}/${tarih.month}/${tarih.year}';

      _kapasiteController.text = sefer['kapasite'].toString();
      _fiyatController.text = sefer['fiyat'].toString();
    });
  }

  void _updateSefer() async {
    if (_formKey.currentState!.validate()) {
      try {
        var tarihList = _tarihController.text.split('/');
        var tarih = DateTime(int.parse(tarihList[2]), int.parse(tarihList[1]), int.parse(tarihList[0]));

        await widget.seferRef.update({
          'firma': _firmaController.text,
          'varisNoktasi': _varisNoktasiController.text,
          'kalkisNoktasi': _kalkisNoktasiController.text,
          'tarih': Timestamp.fromDate(tarih),
          'kapasite': int.parse(_kapasiteController.text),
          'fiyat': double.parse(_fiyatController.text),
        });

        Navigator.pop(context);
      } catch (e) {
        // Hata durumunda kullanıcıya bildirim gösterebilirsiniz.
        print('Sefer güncellenirken bir hata oluştu: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sefer Düzenleme'),
        backgroundColor: Colors.red,

      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _firmaController,
                decoration: InputDecoration(labelText: 'Firma'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Firma bilgisi gereklidir';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _varisNoktasiController,
                decoration: InputDecoration(labelText: 'Varış Noktası'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Varış noktası bilgisi gereklidir';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _kalkisNoktasiController,
                decoration: InputDecoration(labelText: 'Kalkış Noktası'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kalkış noktası bilgisi gereklidir';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tarihController,
                decoration: InputDecoration(labelText: 'Tarih'),
                readOnly: true,
                onTap: () {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    onConfirm: (date) {
                      setState(() {
                        _tarihController.text = '${date.day}/${date.month}/${date.year}';
                      });
                    },
                  );
                },
              ),
              TextFormField(
                controller: _kapasiteController,
                decoration: InputDecoration(labelText: 'Kapasite'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kapasite bilgisi gereklidir';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fiyatController,
                decoration: InputDecoration(labelText: 'Fiyat'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Fiyat bilgisi gereklidir';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _updateSefer,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // İstenilen rengi burada belirtebilirsiniz
                ),
                child: Text('Güncelle'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}