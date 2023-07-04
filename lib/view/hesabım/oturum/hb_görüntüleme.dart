import 'package:flutter/material.dart';

import 'hb_görüntüleme1.dart';

class HesapGoruntuleme extends StatefulWidget {
  const HesapGoruntuleme({Key? key}) : super(key: key);

  @override
  _HesapGoruntulemeState createState() => _HesapGoruntulemeState();
}
class _HesapGoruntulemeState extends State<HesapGoruntuleme>{
  @override
  Widget build(BuildContext context){
    List<Widget> buttons = [
      TextButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HesapGoruntuleme1()),
          );
        },
        label: const Text('Kullanıcı Bilgilerim',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        icon: Icon(Icons.chevron_right),
      ),
      TextButton.icon(
        onPressed: () {

        },
        label:
        const Text('Ödeme Bilgilerim',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        icon: Icon(Icons.chevron_right),
      ),
      TextButton.icon(
        onPressed: () {

        },
        label: const Text('Kayıtlı Yolcularım',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        icon: Icon(Icons.chevron_right),
      ),
      TextButton.icon(
        onPressed: () {

        },
        label: const Text('Fatura Bilgilerim',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        icon: Icon(Icons.chevron_right),
      ),
    ];

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
          child: ListView(
            children: [
              Container(
                child: buttons[0],
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                margin: EdgeInsets.only(top: 50, bottom: 10),
              ),
              Container(
                child: buttons[1],
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                child: buttons[2],
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                child: buttons[3],
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                margin: EdgeInsets.only(bottom: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}