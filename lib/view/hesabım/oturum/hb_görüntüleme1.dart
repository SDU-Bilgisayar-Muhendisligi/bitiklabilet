import 'package:flutter/material.dart';

class HesapGoruntuleme1 extends StatefulWidget {
  const HesapGoruntuleme1({Key? key}) : super(key: key);

  @override
  _HesapGoruntuleme1State createState() => _HesapGoruntuleme1State();
}
class _HesapGoruntuleme1State extends State<HesapGoruntuleme1>{
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
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}