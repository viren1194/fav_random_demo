
import 'package:fav_random_demo/controller/home_controller.dart';
import 'package:fav_random_demo/utils/api_client.dart';
import 'package:get/get.dart';

Future<void> init() async {

  final ApiClient apiClient = ApiClient();
  Get.lazyPut(() => apiClient);

  Get.lazyPut(() => HomeController(apiClient: Get.find()));

}
