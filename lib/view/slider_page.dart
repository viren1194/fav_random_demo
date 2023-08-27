// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:gradient_borders/input_borders/gradient_outline_input_border.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  List<String> imageList = [
    'https://tse1.mm.bing.net/th?id=OIP.1YM53mG10H_U25iPjop83QHaEo&pid=Api&P=0&h=180',
    'https://tse3.mm.bing.net/th?id=OIP.c4MCiDFgSGLsR_7-4-j0PwHaEK&pid=Api&P=0&h=180',
    'https://tse4.mm.bing.net/th?id=OIP.nyFLBYjD207JNHC4hBQBAwHaE8&pid=Api&P=0&h=180',
    'https://tse2.mm.bing.net/th?id=OIP.5SjKih2sQZ_ysAcRIOzJhgHaEo&pid=Api&P=0&h=180',
    'https://tse1.mm.bing.net/th?id=OIP.3MxqaJv2Z5QsG7wIXzizjAHaEo&pid=Api&P=0&h=180'
  ];
  PageController pageController = PageController(initialPage: 0);
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            itemCount: imageList.length,
            onPageChanged: (index) {
              pageController.jumpToPage(index);
            },
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageList[index]),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(color: Colors.black.withOpacity(0.5)),
                ),
              );
            },
          ),
          Container(
            // height: double.infinity,
            // width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black,
                  Colors.black,
                  Color.fromRGBO(7, 5, 5, 0.637),
                  Colors.grey,
                  // Color.fromRGBO(3, 2, 2, 0.479),
                  //   Color.fromRGBO(7, 5, 5, 0.637),
                  //  Color.fromRGBO(128, 128, 128, 0.5),
                  // Color.fromRGBO(255, 255, 255, 0.2),
                ])),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  items: imageList
                      .map((e) => Container(
                       decoration: BoxDecoration(
                      border: GradientBoxBorder(
                        gradient:
                            LinearGradient(colors: [Colors.blue, Colors.red]),
                        width: 2,
                      ),
                          borderRadius: BorderRadius.circular(20),
                      ),
                        child: ClipRRect(
                           borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                e,
                                fit: BoxFit.cover,
                              ),
                            ),
                      ))
                      .toList(),
                  options: CarouselOptions(
                    height: 350,
                    viewportFraction: 0.7,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      pageController.jumpToPage(index);
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: RawScrollbar(
                    radius: Radius.circular(30),
                    thickness: 5.0,
                    crossAxisMargin: 8,
                    isAlwaysShown: true,
                    child: TextField(
                      controller: textController,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      decoration: InputDecoration(
                        border: GradientOutlineInputBorder(
                            gradient: LinearGradient(
                                colors: [Colors.green, Colors.red]),
                            width: 3,
                            borderRadius: BorderRadius.circular(12)),
                        hintText: 'Type here',
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        // contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                      ),
                      maxLines: 3,
                      minLines: 1,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
