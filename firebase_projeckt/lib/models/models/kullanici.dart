import 'package:cloud_firestore_platform_interface/cloud_firestore_platform_interface.dart';

class kullanici{
  final String id;
  final String isim;
  final String soyad;
  final String avatar;
  final String eposta;

  kullanici({required this.id, required this.isim, required this.soyad, required this.avatar, required this.eposta});
  

}