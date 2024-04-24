import 'dart:convert';
import 'package:api1/randomuser.dart';
import 'package:api1/zippoo.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';

import 'list.dart';

class zip extends StatefulWidget {
  const zip({super.key});

  @override
  State<zip> createState() => _zipState();
}

class _zipState extends State<zip> {
  Future<List<Places>> fetchdata() async{
    var result = await http.get(Uri.parse("https://api.zippopotam.us/us/33162"));
    var data = jsonDecode(result.body)["places"];
    return (data as List).map((obj)=> Places.fromJson(obj)).toList();
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
                  List<Places> list = snapshot.data!;
                  return Container(
                    height: 800,
                    child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context,int index){
                          return Column(
                            children: [
                              Text(list[index]!.placeName!.toString()),
                              Text(list[index]!.latitude!.toString()),
                              Text(list[index]!.longitude!.toString()),
                              Text(list[index]!.state!.toString()),
                              Text(list[index]!.stateAbbreviation!.toString()),
                            ],
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
