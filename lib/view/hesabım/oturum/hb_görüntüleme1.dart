import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HesapGoruntuleme1 extends StatefulWidget {
  const HesapGoruntuleme1({Key? key}) : super(key: key);

  @override
  _HesapGoruntuleme1State createState() => _HesapGoruntuleme1State();
}
class _HesapGoruntuleme1State extends State<HesapGoruntuleme1>{
  String _email = "";
  String _nameSurname = "";

  @override
  void initState() {
    super.initState();
    getData();
  }


  void getData() async {
    final firestoreInstance = FirebaseFirestore.instance;
    firestoreInstance.collection("users").doc("user_id").get().then((value) {
      if (value.exists) {
        String email = value.data()!["email"];
        String nameSurname = value.data()!["nameSurname"];
        setState(() {
          _email= email;
          _nameSurname= nameSurname;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context){
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
                Text("Kişisel Bilgiler",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Divider(thickness: 1),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("E-MAIL",style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_email),
                    SizedBox(height: 10),
                    Divider(thickness: 1),
                    SizedBox(height: 20),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("AD SOYAD",style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(_nameSurname),
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
}