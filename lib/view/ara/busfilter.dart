import 'package:flutter/material.dart';

class Bus extends StatefulWidget {
  @override
  _BusState createState() => _BusState();
}

class _BusState extends State<Bus> {
  String selectedSortingOption = 'saate_gore_siralama'; // Varsayılan olarak 'saate göre sıralama' seçili

  List<String> sortingOptions = [
    'saate_gore_siralama',
    'fiyata_gore_siralama'
  ]; // Sıralama seçenekleri

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Filtreleme"),
          centerTitle: true,
          backgroundColor: Colors.red,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            DropdownButton<String>(
              hint: Text("Filtreleme"),
              value: selectedSortingOption,
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedSortingOption = newValue;
                  });
                }
              },
              items: sortingOptions.map<DropdownMenuItem<String>>(
                    (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(

                      value == 'saate_gore_siralama'
                          ? 'Saate Göre Sıralama'
                          : 'Fiyata Göre Sıralama',
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
