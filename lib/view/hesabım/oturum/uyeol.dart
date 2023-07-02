import 'package:bitiklabilet/sabitler/tema.dart';
import 'package:bitiklabilet/view/hesab%C4%B1m/oturum/ikincioturum.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../sabitler/ext.dart';

class Uyeol extends StatefulWidget {
  const Uyeol({Key? key}) : super(key: key);

  @override
  State<Uyeol> createState() => _UyeolState();
}

class _UyeolState extends State<Uyeol> {
  Tema tema = Tema();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  Future<void> registerUser(BuildContext context) async {
    final navigator = Navigator.of(context);
    try {
      UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        // Kullanıcı başarıyla oluşturuldu, Firestore'a kaydet
        await _usersCollection.doc(userCredential.user!.uid).set({
          'email': emailController.text,
          'password': passwordController.text,
        });

        // Başarılı mesajını göster
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Başarılı'),
              content: Text('Kullanıcı başarıyla oluşturuldu.'),
              actions: [
                ElevatedButton(
                  child: Text('Tamam'),
                  onPressed: () {
                    navigator.push(MaterialPageRoute(builder:(context) => ikinciOturum() ,));


                  },
                ),
              ],
            );
          },
        );
      } else {
        // Kullanıcı oluşturulamadı, hata mesajını göster
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Hata'),
              content: Text('Kullanıcı oluşturulamadı. Lütfen tekrar deneyin.'),
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
    } catch (e) {
      // Hata mesajını göster
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Hata'),
            content: Text(e.toString()),
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
                    "Üye Ol",
                    style: GoogleFonts.quicksand(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                  decoration: tema.inputBoxDec(),

                  margin:
                  EdgeInsets.only(top: 10, bottom: 10, right: 30, left: 30),
                  padding:
                  EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: emailController,
                    decoration: tema.inputDec(
                      "E-Posta Adresinizi Girin",
                      Icons.people_alt_outlined,
                    ),
                    style: GoogleFonts.quicksand(
                      color: renk(metin_renk),
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
                    decoration: tema.inputDec(
                      "Şifrenizi Belirleyin",
                      Icons.vpn_key_outlined,
                    ),
                    style: GoogleFonts.quicksand(
                      color: renk(metin_renk),
                      letterSpacing: 5, //şifrelerin arasındaki uzaklık
                    ),
                  ),
                ),
                Container(
                  decoration: tema.inputBoxDec(),
                  margin: EdgeInsets.only(top: 5, bottom: 20, right: 30, left: 30),
                  padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                  child: TextFormField(
                    controller: confirmPasswordController,
                    obscureText: true,
                    decoration: tema.inputDec(
                      "Şifrenizi Belirleyin",
                      Icons.vpn_key_outlined,
                    ),
                    style: GoogleFonts.quicksand(
                      color: renk(metin_renk),
                      letterSpacing: 5, //şifrelerin arasındaki uzaklık
                    ),
                  ),
                ),
                InkWell(
                  child: ElevatedButton(
                    onPressed: () {
                      // Kayıt Ol butonuna tıklandığında kayıt işlemini gerçekleştir
                      if (passwordController.text == confirmPasswordController.text) {
                        registerUser(context);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Hata'),
                              content: Text('Şifreler uyuşmuyor. Lütfen tekrar deneyin.'),
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
                    },
                    child: Text(
                      "Kayıt Ol",
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

