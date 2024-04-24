import 'dart:convert';
import 'package:api1/randomuser.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';

import 'list.dart';

class randam extends StatefulWidget {
  const randam({super.key});

  @override
  State<randam> createState() => _randamState();
}

class _randamState extends State<randam> {

  Future<List<Results>> fetchdata() async{
    var result = await http.get(Uri.parse("https://randomuser.me/api/"));
    var data = jsonDecode(result.body)["results"];
    return (data as List).map((obj)=> Results.fromJson(obj)).toList();
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
                  List<Results> list = snapshot.data!;
                  return Container(
                    height: 800,
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context,int index){
                          return ListTile(
                            title: Text(list[index].gender.toString()),
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
