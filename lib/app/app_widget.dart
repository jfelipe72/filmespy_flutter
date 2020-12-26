import 'package:filmespy_flutter/app/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FilmesPY',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.white,
        accentColorBrightness: Brightness.light,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
