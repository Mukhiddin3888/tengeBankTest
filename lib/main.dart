import 'package:flutter/material.dart';
import 'package:tenge_bank_test/data/utils/color.dart';
import 'package:tenge_bank_test/screens/book_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: BookCard(),
    );
  }
}


