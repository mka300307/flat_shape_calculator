import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalkulator/persegi.dart';
import 'package:kalkulator/segitiga.dart';

import 'Ketupat.dart';
import 'Layang.dart';
import 'Lingkaran.dart';
import 'LuasC.dart';
import 'PersegiPanjang.dart';


ThemeData kalkulatorTheme = ThemeData(
  primaryColor: Color(0xff008080),
  backgroundColor: Color(0xfff8f1f1),
);

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final LuasController controller = Get.put(LuasController());
  TextEditingController ctrSisi = TextEditingController();

  void clearLuasPersegiAndTextField() {
    controller.hasilLuasPersegi.value = 0;
    ctrSisi.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0079ff),
        appBar: AppBar(
          title: Text(
            "Kalkulator Bangun Datar",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Color(0xfff6fa70),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.all(20),
                width: 350,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))

                ),
                child: Center(child: Text("Pilih Bangun Datar",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
              ),

              Expanded(child:
              GridView.count(
                primary: false,
                padding: EdgeInsets.all(10),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(const Persegi()); // Navigate to Persegi page

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(top: 25, left: 8, right: 8),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/persegi.png",
                            width: 120,
                            height: 120,
                          ),
                          Text(
                            "Persegi",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PersegiPanjang()), );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/persegiP.png",
                            width: 136,
                            height: 120,
                          ),
                          Text(
                            'Persegi Panjang',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Lingkaran()), );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.only(top: 25, left: 8, right: 8),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/lingkaran.png",
                            width: 120,
                            height: 120,
                          ),
                          Text(
                            'Lingkaran',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Ketupat()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/ketupat.png",
                            width: 120,
                            height: 120,
                          ),
                          Text(
                            'Ketupat',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Segitiga()), );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
                      child: Column(
                        children: [
                          Image.asset(
                            "images/segitiga.png",
                            width: 120,
                            height: 120,
                          ),
                          Text(
                            'Segitiga Sama kaki',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> Layang()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(top: 15, left: 8, right: 8),

                      child: Column(
                        children: [
                          Image.asset(
                            "images/layang.png",
                            width: 120,
                            height: 120,
                          ),
                          Text(
                            'Layang-layang',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),)
            ],
          ),
        ));
  }
}
