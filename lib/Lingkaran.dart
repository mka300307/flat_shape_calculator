import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'LuasC.dart';
import 'PersegiPanjang.dart';

TextEditingController ctrJari = TextEditingController();
final LuasController control = Get.put(LuasController());

void clearTextField() {
  control.hasilLuasLingkaran.value = 0;
  ctrJari.clear();
}

ThemeData kalkulatorTheme = ThemeData(
  primaryColor: Color(0xff5cd8ff),
  backgroundColor: Color(0xfff8f1f1),
);

class Lingkaran extends StatefulWidget {
  const Lingkaran({Key? key}) : super(key: key);

  Widget myTextField(TextEditingController ctr, String myLabel) {
    return Container(
      height: 60,
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: ctr,
        decoration: InputDecoration(
          labelText: myLabel,
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.number, // Set the keyboard type to numeric
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Allow only numeric input
        ],
      ),
    );
  }

  @override
  State<Lingkaran> createState() => _LingkaranState();
}

class _LingkaranState extends State<Lingkaran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Segitiga Sama Kaki",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: kalkulatorTheme.primaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Image.asset("images/lingkaranLogo.png",width: 300,height: 200,),
            myTextField(ctrJari, "Jari-Jari(r)"),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () => control.luasLingkaran(
                        double.parse(ctrJari.text.toString())
                      ),
                      child: Text("Hitung"),
                    ),
                  ),
                  SizedBox(width: 10), // Add spacing between buttons
                  Container(
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () => clearTextField(),
                      child: Text("Reset"),
                    ),
                  ),
                ],
              ),

            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 50,left: 10),
                        width: 180,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Obx(
                                ()=>Text('${control.hasilLuasLingkaran.value}',style: TextStyle(fontSize: 20),)
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 180,
                        height: 30,
                        decoration: BoxDecoration(
                            color:kalkulatorTheme.primaryColor ,
                            border: Border.all(),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                        ),
                        child: Text("Hasil",style: TextStyle(fontSize: 20,color: Colors.white),),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 50,left: 30),
                          width: 180,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: Text("Luas = π x r²",style: TextStyle(fontSize: 20),)

                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 180,
                        height: 30,
                        decoration: BoxDecoration(
                            color:kalkulatorTheme.primaryColor ,
                            border: Border.all(),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15))
                        ),
                        child: Text("Rumus",style: TextStyle(fontSize: 20,color: Colors.white),),
                      )
                    ],
                  ),
                )

              ],
            ),

          ],
        ),
      ),
    );
  }
}
