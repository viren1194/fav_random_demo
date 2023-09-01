import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowHint extends StatefulWidget {
  const ShowHint({super.key});

  @override
  State<ShowHint> createState() => _ShowHintState();
}

class _ShowHintState extends State<ShowHint> {
  bool isHeartAnimating = false;
  bool isLiked = false;
  bool showAnimation = false; // Flag to control animation visibility
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    bool hasSeenAnimation = prefs.getBool('hasSeenAnimation') ?? false;

    if (!hasSeenAnimation) {
      // If the user has not seen the animation, show it for 5 seconds.
      setState(() {
        showAnimation = true;
      });

      // Set a flag to indicate that the user has seen the animation.
      prefs.setBool('hasSeenAnimation', true);

      // After 5 seconds, hide the animation.
      Future.delayed(Duration(seconds: 5), () {
        setState(() {
          showAnimation = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Column(
        children: [
          Stack(
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
              if (showAnimation)
                Lottie.asset('assets/lotties/double-tap.json', height: 100)
            ],
          ),
        ],
      ),
    );
  }
}
