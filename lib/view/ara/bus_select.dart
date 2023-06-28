import "package:flutter/material.dart";

class Otobus_Hazirlama extends StatefulWidget{
  const Otobus_Hazirlama({Key? key}) : super(key:key);

  @override
  State<Otobus_Hazirlama> createState() => _OtobusHazirlamaState();
}

class _OtobusHazirlamaState extends State<Otobus_Hazirlama>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Sefer Detayları"),
        backgroundColor:Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 84,
        child: BottomAppBar(
          elevation: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            child: Row(
            children: [
              Text("Koltuk 1/1"),

              SizedBox(width: 24),
              Expanded(
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text("Onayla", style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ))
            ],
            ),
          ),
        ),
      ),
    );
}
}