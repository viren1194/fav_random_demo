import 'package:fav_random_demo/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/api_client.dart';

class HomeController extends GetxController implements GetxService {
  ApiClient apiClient;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<String> _stateList = [];
  List<String> get state => _stateList;
  HomeController({required this.apiClient});
  void addFav(String state) {
    final isExist = _stateList.contains(state);
    if (isExist) {
      _stateList.remove(state);
    } else {
      _stateList.add(state);
    }
    update();
  }

  bool isExist(String state) {
    final isExist = _stateList.contains(state);
    return isExist;
  }

  int getLikeCount(String state) {
    return _stateList.where((favState) => favState == state).length;
  }

  Future<void> loginData() async {
    var body = {
      "email": userNameController.text,
      "password": passwordController.text
    };
    Response response = await apiClient.postData(AppConstant.LOGIN, body);
    print('response = ${response.body}');
    if (response.statusCode == 200) {
      update();
    }
  }
}
