import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'LuasC.dart';

TextEditingController ctrd1 = TextEditingController();
TextEditingController ctrd2 = TextEditingController();
final LuasController control = Get.put(LuasController());

void clearTextField() {
  control.hasilLuasLayang.value = 0;
  ctrd1.clear();
  ctrd2.clear();
}

ThemeData kalkulatorTheme = ThemeData(
  primaryColor: Color(0xff0079ff),
  backgroundColor: Color(0xfff8f1f1),
);

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


class Layang extends StatefulWidget {
  const Layang({Key? key}) : super(key: key);

  @override
  State<Layang> createState() => _LayangState();
}

class _LayangState extends State<Layang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Layang",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: kalkulatorTheme.primaryColor,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Image.asset("images/layangLogo.png",width: 300,height: 200,),
              myTextField(ctrd1, "Diagonal1(d1)"),
              myTextField(ctrd2, "Diagonal(d2)"),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    child: ElevatedButton(
                      onPressed: () => control.luasLayang(
                        double.parse(ctrd1.text.toString()),
                        double.parse(ctrd2.text.toString()),
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
                                  ()=>Text('${control.hasilLuasLayang.value}',style: TextStyle(fontSize: 20),)
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
                            width: 180,
                            height: 130,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: Center(child: Text("Luas = 0.5 x d1 x d2",style: TextStyle(fontSize: 18),))

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

