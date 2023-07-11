import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HesapDuzenleme extends StatefulWidget {
  @override
  _HesapDuzenlemeState createState() => _HesapDuzenlemeState();
}

class _HesapDuzenlemeState extends State<HesapDuzenleme> {
  final _formKey = GlobalKey<FormState>();
  final _isimController = TextEditingController();
  final _soyisimController = TextEditingController();
  final _emailController = TextEditingController();

  String? _isim;
  String? _soyisim;
  String? _email ;


  @override
  void initState() {
    super.initState();
    User? currentUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("users").doc(currentUser!.uid).get().then((value) {
      Map<String, dynamic>? data = value.data() as Map<String, dynamic>?;
      setState(() {
        _isim = data?['isim'] as String?;
        _soyisim = data?['soyisim'] as String?;
        _email = data?['email'] as String?;
        _isimController.text = _isim!;
        _soyisimController.text = _soyisim!;
        _emailController.text = _email!!;

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hesap Düzenleme"),
        backgroundColor: Colors.red,
      ),
      body:SingleChildScrollView(
        child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 10),
            Text('Kişisel Bilgiler', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            TextFormField(
              controller: _isimController,
              decoration: InputDecoration(
                labelText: "İsim",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Lütfen isminizi girin";
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _isim = value;
                });
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _soyisimController,
              decoration: InputDecoration(
                labelText: "Soyisim",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Lütfen soyad girin";
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _soyisim = value;
                });
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Lütfen e-mail girin";
                }
                return null;
              },
              onSaved: (value) {
                setState(() {
                  _email = value;
                });
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  User? currentUser = FirebaseAuth.instance.currentUser;
                  await FirebaseFirestore.instance.collection("users").doc(currentUser!.uid).update({
                    'isim': _isim,
                    'soyisim' : _soyisim,
                    'email' : _email,
                  });
                  Navigator.pop(context);
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
                child: Text("Kaydet"),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
