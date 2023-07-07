import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HesapGoruntuleme1 extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    User? currentUser = FirebaseAuth.instance.currentUser;

    if(currentUser==null){
      return Text("Kullanıcı oturumu açmamış");
    }
    return StreamBuilder<DocumentSnapshot>(
      stream : FirebaseFirestore.instance.collection("users").doc(currentUser.uid).snapshots(),
      builder : (BuildContext context , AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Veriler yüklenirken hata oluştu: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Text('Kullanıcı bilgisi bulunamadı');
        }

        Map<String, dynamic>? data = snapshot.data!.data() as Map<
            String,
            dynamic>?;
        String name = data?['isim'] as String? ?? '';
        String surname = data?['soyisim'] as String? ?? '';
        String email = data?['email'] as String? ?? '';

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AppBar Örneği',
          home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.red,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text('Hesabım'),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text("Kişisel Bilgiler", style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Divider(thickness: 1),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("E-MAIL",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("$email"),
                      SizedBox(height: 10),
                      Divider(thickness: 1),
                      SizedBox(height: 20),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("AD",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("$name"),
                      SizedBox(height: 10),
                      Divider(thickness: 1),
                      SizedBox(height: 20),
                    ],
                  ),
                  SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("SOYAD",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("$surname"),
                      SizedBox(height: 10),
                      Divider(thickness: 1),
                      SizedBox(height: 20),
                    ],
                  ),

                ],

              )

          ),
        );
      }
        );
}
}