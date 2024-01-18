
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kelime_kartlari02/pages/etkinlik_sonu.dart';
import 'package:kelime_kartlari02/pages/learning_page.dart';
import 'listeler2.dart';
import 'pages/addWords.dart';
import 'anasayfa.dart';
import 'pages/b1b2_page.dart';
import 'firebase_options.dart';
import 'kelime_kartlari/kelime_bulmaca.dart';
import 'kelime_kartlari/kelime_kartlari_eslestirme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CollectionReference myCollection = FirebaseFirestore.instance
      .collection('kelimelerx')
      .doc('3tJp5Q0jCQverOirlykD')
      .collection('renkler');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => AnaSayfa(),
        '/months1' : (context) => KelimeKartlari("months and season1"),
        '/months2' : (context) => KelimeKartlari("months and season2"),
        '/fourth' : (context) => B1B2Page(),
        '/addwords': (context) => KelimeKartlari("renkler"),
        '/paintingb1b2': (context)=> KelimeKartlari("art1"),
        '/colorsb1': (context)=> KelimeKartlari("colors b1"),
        '/numbers1': (context)=> KelimeKartlari("numbers1"),
        '/numbers7-13': (context)=> KelimeKartlari("numbers7-13"),
        '/numbers14-20': (context)=> KelimeKartlari("numbers14-20"),
        '/numbers21-27': (context)=> KelimeKartlari("numbers21-27"),
        '/colors1': (context)=> KelimeKartlari("renkler"),
        '/fruits1' : (context) => KelimeKartlari("fruits1"),
        '/fruits2' : (context) => KelimeKartlari("fruits2"),
        '/fruits3' : (context) => KelimeKartlari("fruits3"),
        '/veggies1' : (context) => KelimeKartlari("vegetables1"),
        '/veggies2' : (context) => KelimeKartlari("vegetables2"),
        '/veggies3' : (context) => KelimeKartlari("vegetables3"),
        '/house1' : (context) => KelimeKartlari("house1"),
        '/house2' : (context) => KelimeKartlari("house2"),
        '/livingroom1' : (context) => KelimeKartlari("livingroom1"),
        '/bedroom1' : (context) => KelimeKartlari("bedroom1"),
        '/software' : (context) => KelimeKartlari('software'),
        '/techtrends' : (context) => KelimeKartlari('techtrends'),
        '/internet' : (context) => KelimeKartlari('internet'),
        '/ecommerce' : (context) => KelimeKartlari('ecommerce'),
        '/security' : (context) => KelimeKartlari('security'),
        '/green technology' : (context) => KelimeKartlari('green technology'),
        '/learningpagephrasalverbs': (context )=> LearningPage(listephrasalverbs,'Phrasal Verbs'),
        '/learningpagea1': (context )=> LearningPage(a1vocabulary,'A1 VOCABULARY'),
        '/learningpagea2': (context )=> LearningPage(a2vocabulary,'A2 VOCABULARY'),






        //'/sixth': (context) => Kelimeogren(),

      },
    );
  }
}