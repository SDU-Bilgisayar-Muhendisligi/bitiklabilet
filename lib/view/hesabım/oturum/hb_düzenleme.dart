import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HesapDuzenleme extends StatefulWidget {
  const HesapDuzenleme({Key? key}) : super(key: key);

  @override
  _HesapDuzenlemeState createState() => _HesapDuzenlemeState();
}
class _HesapDuzenlemeState extends State<HesapDuzenleme>{
  final _emailController = TextEditingController();
  final _nameSurnameController = TextEditingController();

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
          _emailController.text = email;
          _nameSurnameController.text = nameSurname;
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
            children: [
              Text("Kişisel Bilgiler"),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "E-MAIL",
                  hintText: "E-MAIL",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _nameSurnameController,
                decoration: InputDecoration(
                  labelText: "AD SOYAD",
                  hintText: "AD SOYAD",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          )

      ),
    );
  }
}