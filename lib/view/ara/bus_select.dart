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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.blue[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Text("Dolu Erkek",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                ),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.pink[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Text("Dolu Kadın",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,),),
                Container(
                  height: 32,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Text("Boş Koltuk",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(42),
                    child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(6)
                            ),
                            child: Center(
                              child: Text("1",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ) ,),
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text("2",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ) ,),
                            ),
                            ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(right: 16),
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Center(
                              child: Text("3",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ) ,),
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Center(
                              child: Text("4",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ) ,),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Center(
                              child: Text("5",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ) ,),
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text("6",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ) ,),
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(right: 16),
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Center(
                              child: Text("7",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ) ,),
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Center(
                              child: Text("8",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ) ,),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            margin: EdgeInsets.only(right: 16),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Center(
                              child: Text("9",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ) ,),
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: Text("10",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ) ,),
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(right: 16),
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Center(
                              child: Text("11",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ) ,),
                            ),
                          ),
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child: Center(
                              child: Text("12",
                                style:TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ) ,),
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                ),
              ),
          )
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 84,
        child: BottomAppBar(
          elevation: 64,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
            child: Row(
            children: [
              Text("Koltuk 1/1",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),),

              SizedBox(width: 24),
              Expanded(
                  child: Container(
                    height: 54,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: const Center(
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