import 'package:get/get.dart';

class HomeController extends GetxController implements GetxService {
  List<String> _stateList = [];
  List<String> get state => _stateList;

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
}
