import 'package:bitiklabilet/sabitler/tema.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../sabitler/ext.dart';
import 'ikincioturum.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
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
        // Giriş başarılı, işlemleri yapabilirsiniz.
        // Örneğin, kullanıcıyı ana sayfaya yönlendirebilirsiniz.
        navigator.push(MaterialPageRoute(builder:(context) => ikincioturum() ,));
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
                    decoration: tema.inputDec("Şifrenizi Girin", Icons.vpn_key_outlined),
                    style: GoogleFonts.quicksand(
                      color: renk(metin_renk),
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
