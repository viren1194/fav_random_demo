// ignore_for_file: prefer_const_constructors

import 'package:fav_random_demo/view/home_page.dart';
import 'package:fav_random_demo/view/my_fav.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Color color = Color(int.parse('cdc0b1', radix: 16) + 0xff000000);
  int currentPage = 0;

  List<Widget> pages = [HomePage(), MyFav()];
  void changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('color = $color');
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.black,
          ),
          height: 70,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () => changePage(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    currentPage == 0
                        ? GradientIcon(
                            imagePath: 'assets/icons/home.png',
                            gradient: LinearGradient(
                              colors: [
                                Colors.green,
                                Colors.red
                              ], // Replace with your gradient colors
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            iconSize: 30,
                          )
                        : Image.asset(
                            'assets/icons/home.png',
                            height: 30,
                          ),
                    Text(
                      "Home",
                      style: TextStyle(
                        color: color,
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () => changePage(1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    currentPage == 1
                        ? GradientIcon(
                            imagePath: 'assets/icons/folder.png',
                            gradient: LinearGradient(
                              colors: [
                                Colors.green,
                                Colors.red
                              ], // Replace with your gradient colors
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            iconSize: 30,
                          )
                        : Image.asset(
                            'assets/icons/folder.png',
                            height: 30,
                          ),
                    Text(
                      "file",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class GradientIcon extends StatelessWidget {
  final String imagePath;
  final Gradient gradient;
  final double iconSize;

  GradientIcon({
    required this.imagePath,
    required this.gradient,
    this.iconSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Image.asset(
        imagePath,
        height: iconSize,
      ),
    );
  }
}
