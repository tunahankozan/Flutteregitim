import 'package:firebase_projeckt/models/models/kullanici.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Anasayfa()
    );
  }
}
class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final db=Firestore.instance;


  void kulanicilarigetir()async{
  var snapshot= await db.collection("kullanıcılar").getDocuments();
  snapshot.documents.forEach((doc) {
    print(doc.data);
  });
  
  
  }
  void kimlikilekulanicilarigetir()async{
  var doc= await db.collection("kullanıcılar").document("YBFmhubGOMaNeDS07aki").get();
  
  if(doc.exists){
    print(doc.data);

  }else{
    print("böyle bir döküman yoktur");
  }
  kullaniciolustur()async{
    var doc= await db.collection("kullanıcılar").document("qybOLFMeQ6JpWRtyNMUj").get();
   var kullanici_1=kullanici(
    
      id: doc.documentID,
      isim: doc.data["isim"],
      soyad: doc.data["soyisim"],
      eposta: doc.data["mail"],
      avatar: doc.data["avatar"]
    );
    print(kullanici_1.id);
    print(kullanici_1.eposta);
    print(kullanici_1.avatar);
    print(kullanici_1.isim);
    print(kullanici_1.soyad);

  }
  
  }
  @override
  void initState() {
    kimlikilekulanicilarigetir();
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
