import 'package:bitiklabilet/view/ara/otobüs_ayrinti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class Ara extends StatefulWidget {
  const Ara({Key? key}) : super(key: key);

  @override
  _AraState createState() => _AraState();

}

class _AraState extends State<Ara>{
  bool tripType=false;
  int _counter=0;
   late String _selectedNereden="Denizli";
   late String _selectedNereye="İstanbul";
  final List<String> _neredenList = [
    "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Aksaray", "Amasya", "Ankara", "Antalya", "Ardahan", "Artvin", "Aydın", "Balıkesir", "Bartın", "Batman", "Bayburt", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Düzce", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkâri", "Hatay", "Iğdır", "Isparta", "İstanbul", "İzmir", "Kahramanmaraş", "Karabük", "Karaman", "Kars", "Kastamonu", "Kayseri", "Kilis", "Kırıkkale", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Mardin", "Mersin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Osmaniye", "Rize", "Sakarya", "Samsun", "Şanlıurfa", "Siirt", "Sinop", "Sivas", "Şırnak", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Uşak", "Van", "Yalova", "Yozgat", "Zonguldak"
  ];

  final List<String> _nereyeList = [
    "Adana", "Adıyaman", "Afyonkarahisar", "Ağrı", "Aksaray", "Amasya", "Ankara", "Antalya", "Ardahan", "Artvin", "Aydın", "Balıkesir", "Bartın", "Batman", "Bayburt", "Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale", "Çankırı", "Çorum", "Denizli", "Diyarbakır", "Düzce", "Edirne", "Elazığ", "Erzincan", "Erzurum", "Eskişehir", "Gaziantep", "Giresun", "Gümüşhane", "Hakkâri", "Hatay", "Iğdır", "Isparta", "İstanbul", "İzmir", "Kahramanmaraş", "Karabük", "Karaman", "Kars", "Kastamonu", "Kayseri", "Kilis", "Kırıkkale", "Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya", "Malatya", "Manisa", "Mardin", "Mersin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Osmaniye", "Rize", "Sakarya", "Samsun", "Şanlıurfa", "Siirt", "Sinop", "Sivas", "Şırnak", "Tekirdağ", "Tokat", "Trabzon", "Tunceli", "Uşak", "Van", "Yalova", "Yozgat", "Zonguldak"
  ];
  DateTime? _departureDate;
  DateTime? _returnDate;

  @override
  Widget build(BuildContext context){

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child:SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        Text(
          "bitiklabilet dünyamıza",
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text("hoşgeldiniz",
        style: GoogleFonts.montserrat(
          fontSize:24,
          fontWeight: FontWeight.bold,
        ),
        ),
         Scrollbar(child:
         Container(
           height: 140,
           child: Stack(
             children: [
               Positioned(
                 left:0,
                 right: 0,
                 bottom: 0,
                 top: 0,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   DropdownButtonFormField(
                     iconSize: 10,
                     value: _selectedNereden,
                     items: _neredenList.map((String nereden) {
                       return new DropdownMenuItem<String>(
                         value: nereden,
                         child: new Text(nereden),
                       );
                     }).toList(),
                     onChanged: (String? newValue) {
                       setState(() {
                         _selectedNereden = newValue!;
                         Navigator.push(
                           context,
                           MaterialPageRoute(
                             builder: (context) => Otobus_Detay(selectedNereden: _selectedNereden),
                           ),
                         );


                       });
                     },
                     decoration: InputDecoration(labelText: 'NEREDEN'),
                   ),
                   DropdownButtonFormField(
                     iconSize: 10,
                     value: _selectedNereye,
                     items: _nereyeList.map((String nereye) {
                       return new DropdownMenuItem<String>(
                         value: nereye,
                         child: new Text(nereye),
                       );
                     }).toList(),
                     onChanged: (String? newValue) {
                       setState(() {
                         _selectedNereye = newValue!;
                       });
                     },
                     decoration: InputDecoration(labelText: 'NEREYE'),
                   ),
                 ],
                ),
               )
             ]
           ),
               ),
         ),
               Positioned(
                 right: 10,
                   bottom: 10,
                   top: 10,
                   child: GestureDetector(
                     onTap: (){
                       setState(() {
                         final tmpText=_selectedNereden;
                         _selectedNereden=_selectedNereye;
                         _selectedNereye=tmpText;
                       });
                       },
                   child:const Center(
                   child: CircleAvatar(
                     radius: 32,
                     backgroundColor: Colors.red,
                     foregroundColor: Colors.white,
                     child: Icon(
                       Icons.sync,
                     ),
                   ),
               ),
               ),
               ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 24),
            child:Row(
               children: [
                 Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                       Text('Gidiş Tarihi',
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 16,
                           color: Colors.grey,
                       ),
                 ),
                      SizedBox(height: 16,),
                      ElevatedButton(
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: _departureDate ?? DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          ).then((value){
                            if (value != null && value.isAfter(DateTime.now().subtract(Duration(days: 1)))) {
                              setState(() {
                                _departureDate=value;
                              });
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        child: Text(_departureDate == null ? 'Select date' : DateFormat('dd/MM/yyyy').format(_departureDate!)),
                      ),
               ],
             ),
             ),
                 ],
           ),
         ),
         SizedBox(height: 30),
         Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
             onPressed: () {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => Otobus_Detay(selectedNereden: '', )),
             );
             },
             style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all<Color>(
               Colors.green.shade400,
             ),
             padding: MaterialStateProperty.all<EdgeInsets>(
               EdgeInsets.only(left: 15,right: 15,top: 15,bottom: 15),
             ),
             ),
               child: Text("Otobüs Bileti Bul",
             style: GoogleFonts.quicksand(
               color: Colors.white,
               fontSize: 18,
               fontWeight: FontWeight.w600,
             ),
           ),
         ),
         ]
          ),
         ),
         SizedBox(height: 20),
         Text("Kesintisiz İade Hakkı ve 0 Komisyon",
         style: TextStyle(
           color: Colors.grey[500]
         ),)

],
      ),
    ),
    );


  }

}

class DatePicker {
  static showDatePicker(BuildContext context, {required DateTime initialDate, required DateTime firstDate, required DateTime lastDate, required BuildContext context2 }) async {}
}
























