import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'LuasC.dart';


TextEditingController ctrSisi = TextEditingController();
final LuasController control = Get.put(LuasController());

void clearTextField() {
  control.hasilLuasPersegi.value=0;
  ctrSisi.clear();
}


ThemeData kalkulatorTheme = ThemeData(
  primaryColor: Color(0xff0079ff),
  backgroundColor: Color(0xfff8f1f1),
);

class Persegi extends StatefulWidget {
  const Persegi({Key? key}) : super(key: key);

  @override
  State<Persegi> createState() => _PersegiState();
}

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

class _PersegiState extends State<Persegi> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Persegi",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: kalkulatorTheme.primaryColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Image.asset("images/persegiLogo.png",width: 300,height: 200,),
                myTextField(ctrSisi, "Sisi(s)"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 180,
                      child: ElevatedButton(
                        onPressed: () => control.luasPersegi(
                          double.parse(ctrSisi.text.toString()),
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
                                    ()=>Text('${control.hasilLuasPersegi.value}',style: TextStyle(fontSize: 20),)
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
                      padding: EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          Container(
                              width: 180,
                              height: 130,
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              child: Center(child: Text("Luas = s²",style: TextStyle(fontSize: 20),))

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
        ),
    );
  }
}
