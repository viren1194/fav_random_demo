import 'package:fav_random_demo/controller/home_controller.dart';
import 'package:fav_random_demo/view/my_fav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _DemoPageState();
}

class _DemoPageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());
  List<String> stateList = [
    'Gujarat',
    "Maha",
    "UP",
    "Mp",
    "Delhi",
    "HR",
    "Punjab",
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Bihar",
    'Jharkhand',
    "Kerala",
    "Mizoram",
    "Rajasthan",
    "Odisha",
    "Sikkim",
    "West Bengal",
    "Asaam"
  ];

  List<String> tempFavList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home page"),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(MyFav());
              },
              icon: const Icon(Icons.favorite))
        ],
      ),
      body: GetBuilder<HomeController>(builder: (homeController) {
        return ListView.builder(
          itemCount: stateList.length,
          itemBuilder: (context, index) {
            final state = stateList[index];
            return Card(
              child: ListTile(
                title: Text(state),
                trailing: IconButton(
                  onPressed: () {
                    homeController.addFav(state);
                  },
                  icon: homeController.isExist(state)
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
