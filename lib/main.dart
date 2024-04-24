
import 'package:api1/listrr.dart';
import 'package:api1/randam.dart';
import 'package:api1/univer.dart';
import 'package:api1/zippo.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: zip()
    );
  }
}


