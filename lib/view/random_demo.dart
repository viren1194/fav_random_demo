import 'dart:math';

import 'package:flutter/material.dart';

class RandomDemo extends StatefulWidget {
  const RandomDemo({super.key});

  @override
  State<RandomDemo> createState() => _RandomDemoState();
}

class _RandomDemoState extends State<RandomDemo> {
  List<String> nameList = ["viren", 'kunal','akshay','rajesh','mithesh','pradeep','lokesh'];
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Text(name),
        ElevatedButton(onPressed: () {
        
           setState(() {
                name = nameList[Random().nextInt(nameList.length)];
              });
                print(name);
     
        }, child: Text("change"))
      ],),
    );
  }
}