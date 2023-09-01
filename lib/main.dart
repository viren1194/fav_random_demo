import 'package:fav_random_demo/view/dashboard.dart';
import 'package:fav_random_demo/view/home_page.dart';
import 'package:fav_random_demo/view/insta_like/insta_like.dart';
import 'package:fav_random_demo/view/insta_like/show_hint.dart';
import 'package:fav_random_demo/view/login/splash_screen.dart';
import 'package:fav_random_demo/view/shared_pref/sharedpref_ex.dart';
import 'package:fav_random_demo/view/slider_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/get_di.dart' as di;
import 'view/shared_pref/shared_pref_list.dart';

void main() {
  di.init();
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
      // home: SliderPage(),
      // home: SharedPrefEx(),
      // home: SharedPrefList(),
      // home: SplashScreen(),
      // home: Dashboard(),
      home: InstaLike(),
      // home: ShowHint(),
    );
  }
}
