import 'package:bitiklabilet/sabitler/tema.dart';
import 'package:bitiklabilet/backend/editor_paneli.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../sabitler/ext.dart';


class Editorgiris extends StatefulWidget {
  const Editorgiris({Key? key}) : super(key: key);

  @override
  State<Editorgiris> createState() => EditorgirisState();
}

class EditorgirisState extends State<Editorgiris> {
  Tema tema = Tema();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signInUser() async {
    final navigator = Navigator.of(context);
    String email = emailController.text;
    String password = passwordController.text;

    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // Kullanıcı girişi başarılı, "admin" koleksiyonunu kontrol et
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('adusers')
            .where('email', isEqualTo: email) // Kullanıcının e-posta adresini kontrol edin
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          // "admin" koleksiyonunda belgeler bulundu, işlemleri yapabilirsiniz
          navigator.push(MaterialPageRoute(builder: (context) => EditorPaneli()));
        } else {
          // "admin" koleksiyonunda belge bulunamadı, hata mesajını göster
          showErrorDialog('Yönetici yetkisine sahip değilsiniz.');
        }
      } else {
        // Giriş yapılamadı, hata mesajını göster
        showErrorDialog('Giriş yapılamadı. Lütfen bilgilerinizi kontrol edin.');
      }
    } catch (e) {
      // Hata mesajını göster
      showErrorDialog(e.toString());
    }
  }

  void showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Hata'),
          content: Text(errorMessage),
          actions: [
            ElevatedButton(
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Giriş Yapın",
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  decoration: tema.inputBoxDec(),
                  margin: EdgeInsets.only(top: 10, bottom: 10, right: 30, left: 30),
                  padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: emailController,
                    decoration: tema.inputDec("E-Posta Adresinizi Girin", Icons.people_alt_outlined),
                    style: GoogleFonts.quicksand(
                      color: Renk(metinRenk),
                    ),
                  ),
                ),
                Container(
                  decoration: tema.inputBoxDec(),
                  margin: EdgeInsets.only(top: 5, bottom: 20, right: 30, left: 30),
                  padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: tema.inputDec("Şifrenizi Girin", Icons.vpn_key_outlined),
                    style: GoogleFonts.quicksand(
                      color: Renk(metinRenk),
                      letterSpacing: 5,
                    ),
                  ),
                ),
                InkWell(
                  child: ElevatedButton(
                    onPressed: () {
                      signInUser();
                    },
                    child: Text(
                      "GİRİŞ YAP",
                      style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

