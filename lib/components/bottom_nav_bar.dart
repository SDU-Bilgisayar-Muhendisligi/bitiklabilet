import 'package:bitiklabilet/riverpod_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavBar extends ConsumerWidget{
  const BottomNavBar({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var watch = ref.watch(bottomNavBarRiverpod);
    var read = ref.read(bottomNavBarRiverpod);
   return BottomNavigationBar(
     selectedItemColor: Colors.red,
       items: read.items,
     currentIndex: watch.currentIndex,
     onTap: (index) => read.setCurrentIndex(index),
   );
  }
}