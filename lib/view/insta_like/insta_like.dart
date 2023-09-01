import 'package:fav_random_demo/view/insta_like/heart_animation_widget.dart';
import 'package:flutter/material.dart';

class InstaLike extends StatefulWidget {
  const InstaLike({super.key});

  @override
  State<InstaLike> createState() => _InstaLikeState();
}

class _InstaLikeState extends State<InstaLike> {
  bool isHeartAnimating = false;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Column(
        children: [
          GestureDetector(
            onDoubleTap: () {
              setState(() {
                isHeartAnimating = true;
                isLiked = true;
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  // color: Colors.black,
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQPCXISA7AWonO3J24GKCgtJ9e4OTuaJHSBM7rcN3j28GfR6eJAJTe1Gi_AlJpG6wuFnCs&usqp=CAU',
                    fit: BoxFit.cover,
                  ),
                ),
                Opacity(
                  opacity: isHeartAnimating ? 1 : 0,
                  child: HeartAnimationWidget(
                    isAnimating: isHeartAnimating,
                    duration: Duration(milliseconds: 700),
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 100,
                    ),
                    onEnd: () {
                      setState(() {
                        isHeartAnimating = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          buildActions()
        ],
      ),
    );
  }

  Widget buildActions() {
    final icon = isLiked ? Icons.favorite : Icons.favorite_outline;
    final color = isLiked ? Colors.red : Colors.white;

    return Container(
      padding: EdgeInsets.all(4),
      child: Row(children: [
        HeartAnimationWidget(
          alwaysAnimate: true,
          isAnimating: isLiked,
          child: IconButton(
              onPressed: () => setState(() => isLiked = !isLiked),
              icon: Icon(
                icon,
                color: color,
                size: 28,
              )),
        )
      ]),
    );
  }
}
