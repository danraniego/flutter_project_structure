import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mvc/views/home/home.view.dart';

void main() async {

  await dotenv.load(fileName: ".env"); // Load .env file

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'MVC Pattern',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const Home(),
  ));
}
