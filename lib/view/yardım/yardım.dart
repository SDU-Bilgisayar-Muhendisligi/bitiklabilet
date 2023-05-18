import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Yardim extends ConsumerWidget{
  @override
  Widget build(BuildContext context,WidgetRef ref){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppBar Örneği',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("Yardım"),
        ),
      ),
    );
  }
}