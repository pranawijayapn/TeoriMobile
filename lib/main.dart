import 'package:flutter/material.dart';
import 'package:mobile/pages/login.dart';
import 'package:mobile/pages/main_page.dart';
import 'package:mobile/pages/welcomescreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile/pages/main_page_tv.dart';
import 'package:mobile/pages/main_page_movie.dart';
import 'package:mobile/pages/PageMain.dart';

late final FirebaseApp app;
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyDNwMJ2VdVOZsEIHcIq7FRz4yKNmy7BLPU", 
    appId: "1:985565572833:android:899b099dc87c5d0dcc11a0", 
    messagingSenderId: "message", projectId: "flimflix-c11d7"),

  );
  runApp(const MyApp());
}
// void main()
// {
//   runApp(MyApp());
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(home: Login(),
    debugShowCheckedModeBanner: false,);
  }
}