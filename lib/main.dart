import 'package:flutter/material.dart';
import 'package:socialvolks/src/pages/home_page.dart';
import 'package:socialvolks/src/pages/imageview_page.dart';
import 'package:socialvolks/src/pages/login_page.dart';
// import 'package:socialvolks/src/pages/profile_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Material App',
      debugShowCheckedModeBanner: true,
      initialRoute: 'login',
      routes: {
        'home' : (BuildContext context) => HomePage(),
        'login' : (BuildContext context) => LoginPage(),
        'image' : (BuildContext context) => ImageViewPage(),
        // 'profile' : (BuildContext context) => ProfilePage(),
      },
    );
  }
}