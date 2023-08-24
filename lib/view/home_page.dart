import 'package:fav_random_demo/controller/home_controller.dart';
import 'package:fav_random_demo/view/my_fav.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';

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
 bool isLiked = false;
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
                trailing:  LikeButton(
                        isLiked: isLiked,
                        size: 30,
                        animationDuration: Duration(seconds: 2),
                        likeCount: 1,
                        countPostion: CountPostion.bottom,
                      
                        likeBuilder: (isLiked) {
                          final color = isLiked?Colors.red: Colors.black;
                          return Icon(isLiked?Icons.favorite: Icons.favorite_border,color: color,);
                        },
                        countBuilder: (likeCount, isLiked, text) {
                          final color = isLiked?Colors.red: Colors.black;
                          return Text(
                            text,
                            style: TextStyle(
                              color: color,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),
                          );
                        },
                        onTap: (isLiked) async{
                          //  homeController.addFav(state);
                           print(!isLiked);
                
                          return !isLiked;
                        },
                      )
                //  IconButton(
                //   onPressed: () {
                //     homeController.addFav(state);
                //   },
                //   icon: homeController.isExist(state)
                //       ? Icon(Icons.favorite)
                //       : Icon(Icons.favorite_border),
                // ),
              ),
            );
          },
        );
      }),
    );
  }
}
