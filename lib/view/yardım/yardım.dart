import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Yardim extends ConsumerWidget{
  const Yardim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref){
    List<Widget> buttons = [
      TextButton.icon(
        onPressed: () {

        },
        label:const Text('Otobüs biletimi nasıl açığa alabilirim?',
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
        const Text('Otobüs biletimi nasıl değiştirebilirim?',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        icon: Icon(Icons.chevron_right),
      ),
      TextButton.icon(
        onPressed: () {

        },
        label:const Text('Açığa aldığım otobüs biletimi nasıl kullanabilirim?',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        icon: Icon(Icons.chevron_right),
      ),
      TextButton.icon
        (
        onPressed: () {

        },
        label:const Text('Kampanya kodları nasıl kullanılabilir?',
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
          centerTitle: true,
          title: Text("Yardım"),
        ),
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color:Colors.black12,
              width: 2,
            ),
          ),
          child: ListView(
            children: [
              Container(
                child: buttons[0],
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Colors.grey,
                    width: 2,
                  ),
                ),
                margin: EdgeInsets.only(top:50,bottom: 10),
              ),
              Container(
                child: buttons[1],
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Colors.grey,
                    width: 2,
                  ),
                ),
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                child: buttons[2],
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Colors.grey,
                    width: 2,
                  ),
                ),
                margin: EdgeInsets.only(bottom: 10),
              ),
              Container(
                child: buttons[3],
                decoration: BoxDecoration(
                  border: Border.all(
                    color:Colors.grey,
                    width: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}