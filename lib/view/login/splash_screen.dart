import 'dart:async';

import 'package:fav_random_demo/view/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LoginPage();
      },));
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Spalsh"),),
    );
  }
}