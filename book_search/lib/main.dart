import 'package:book_search/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPageBoot(),
    );
  }
}