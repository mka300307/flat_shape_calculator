import 'package:get/get.dart';

class LuasController extends GetxController{
  final hasilLuasKetupat = RxDouble(0.0);
  final hasilLuasPersegi = RxDouble(0.0);
  final hasilLuasPersegiPanjang = RxDouble(0.0);
  final hasilLuasLayang = RxDouble(0.0);
  final hasilLuasLingkaran = RxDouble(0.0);
  final hasilLuasSegitiga = RxDouble(0.0);

  luasKetupat (double d1,double d2){
    hasilLuasKetupat.value = 0.5 * d1 * d2;
  }

  luasSegitiga (double L,double A){
    hasilLuasSegitiga.value = 0.5 * L * A;
  }

  luasPersegi(double sisi){
    hasilLuasPersegi.value = sisi*sisi;
  }

  luasPersegiPanjang(double panjang,double lebar){
    hasilLuasPersegiPanjang.value = panjang * lebar;
  }

  luasLayang(double diagonal1, double diagonal2){
    hasilLuasLayang.value = 0.5 * diagonal1 * diagonal2;
  }

  luasLingkaran(double jari){
    hasilLuasLingkaran.value = 3.14 * jari * jari ;
  }

}