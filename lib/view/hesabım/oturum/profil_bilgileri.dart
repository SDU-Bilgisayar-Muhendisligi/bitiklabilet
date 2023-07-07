
import 'package:bitiklabilet/view/hesab%C4%B1m/oturum/hb_d%C3%BCzenleme.dart';
import 'package:bitiklabilet/view/hesab%C4%B1m/oturum/hesap_dondurma.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'hb_görüntüleme.dart';

class Profil extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    List<Widget> buttons = [
      TextButton.icon(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HesapGoruntuleme()),
          );
        },
        label: const Text('Hesap Bilgilerini Görüntüleme',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        icon: Icon(Icons.chevron_right),
      ),
      TextButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HesapDuzenleme()),
          );
        },
        label:
        const Text('Hesap Bilgilerini Düzenleme',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        icon: Icon(Icons.chevron_right),
      ),
      TextButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HesapDondurma()),
          );
        },
        label: const Text('Hesap Dondurma',
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
          title: Text('Profilim'),
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
            ],
          ),
        ),
      ),
    );
  }
}