import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
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
  String selectedState = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
       
        itemCount: stateList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedState = stateList[index];
              });
              print('state = $selectedState');
            },
            child: Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              color: selectedState == stateList[index]
                  ? Colors.amber
                  : Colors.deepPurple,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(stateList[index]),
                      LikeButton(
                        isLiked: false,
                        size: 30,
                        animationDuration: Duration(seconds: 2),
                      
                        countPostion: CountPostion.bottom,
                      
                        likeBuilder: (isLiked) {
                          final color = isLiked?Colors.red: Colors.white;
                          // return Icon(isLiked?Icons.favorite: Icons.favorite_border,color: color,);
                          return Image.asset('assets/icons/idea.png');
                        },
                      
                        onTap: (isLiked) async{
                          return !isLiked;
                        },
                      )
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.favorite_border),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
