// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class MyFav extends StatefulWidget {
  @override
  State<MyFav> createState() => _MyFavState();
}

class _MyFavState extends State<MyFav> {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final states = homeController.state;
    return Scaffold(
      appBar: AppBar(
        title: Text("Fav List"),
      ),
      body: GetBuilder<HomeController>(builder: (homeController) {
        return ListView.builder(
          itemCount: states.length,
          itemBuilder: (context, index) {
            final state = states[index];
            return Card(
              child: ListTile(
                title: Text(state),
                trailing: IconButton(
                  onPressed: () {
                    homeController.addFav(state);
                  },
                  icon: Icon(Icons.favorite),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
