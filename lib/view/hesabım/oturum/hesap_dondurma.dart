import 'package:bitiklabilet/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ara/ara.dart';

class HesapDondurma extends StatefulWidget {
  @override
  _HesapDondurmaState createState() => _HesapDondurmaState();
}

class _HesapDondurmaState extends State<HesapDondurma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hesap Dondurma"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            bool? result = await showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Emin misiniz?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text("Evet"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text("Hayır"),
                    ),
                  ],
                );
              },
            );
            if (result == true) {
              User? currentUser = FirebaseAuth.instance.currentUser;
              await FirebaseFirestore.instance.collection("users").doc(currentUser!.uid).update({
                'donduruldu': true,
              });
              await FirebaseAuth.instance.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
              Navigator.pushNamed(context, '/MyApp');
              Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
            }
          },
          child: Text("Hesabımı Dondur"),
        ),
      ),
    );
  }
}