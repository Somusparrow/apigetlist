import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';

import 'list.dart';

class getlist extends StatefulWidget {
  const getlist({super.key});

  @override
  State<getlist> createState() => _getlistState();
}

class _getlistState extends State<getlist> {

  Future<List<Entries>> fetchdata() async{
    var result = await http.get(Uri.parse("https://api.publicapis.org/entries"));
    var data = jsonDecode(result.body)["entries"];
    return (data as List).map((obj)=> Entries.fromJson(obj)).toList();
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
                  List<Entries> list = snapshot.data!;
                  return Container(
                    height: 800,
                    child: ListView.builder(
                      itemCount: list.length,
                        itemBuilder: (context,int index){
                        return ListTile(
                          title: Text(list[index].aPI.toString()),
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
