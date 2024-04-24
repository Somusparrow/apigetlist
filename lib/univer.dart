import 'dart:convert';
import 'package:api1/universities.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';

import 'list.dart';

class univer extends StatefulWidget {
  const univer({super.key});

  @override
  State<univer> createState() => _univerState();
}

class _univerState extends State<univer> {

  Future<List<universites>> fetchdata() async{
    var result = await http.get(Uri.parse("http://universities.hipolabs.com/search?country=United+States"));
    var data = jsonDecode(result.body)["universites"];
    return (data as List).map((obj)=> universites.fromJson(obj)).toList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: fetchdata(),
              builder: (BuildContext context, snapshot){
                if(snapshot.hasData){
                  List<universites> list = snapshot.data!;
                  return Container(
                    height: 800,
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context,int index){
                          return ListTile(
                            title: Text(list[index].stateProvince.toString()),
                          );
                        }),
                  );
                } else if (snapshot.hasError){
                  return Text("${snapshot.error}");
                }return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }
}
