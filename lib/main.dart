
import 'package:bitiklabilet/view/base_scaffold/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

        debugShowCheckedModeBanner: false,
        title: "Material App",
        home: BaseScaffold(),
    );
  }
}

