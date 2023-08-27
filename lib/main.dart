
import 'package:fav_random_demo/view/home_page.dart';
import 'package:fav_random_demo/view/slider_page.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      // home: HomePage(),
      // home: RandomDemo(),
      // home: DemoPage(),
      home: SliderPage(),
    
    );
  }
}
