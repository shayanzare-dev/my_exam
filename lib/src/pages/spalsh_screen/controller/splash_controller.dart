import 'dart:async';

import 'package:get/get.dart';

import '../../../insfrastucture/routes/route_names.dart';

class SplashController extends GetxController {
  void waitForNextPage() async{
    print("delay end");
    Future.delayed(const Duration(seconds: 3))
        .then(
          (value) => Get.offAndToNamed(RouteNames.login),
        )
        .catchError((e) => print(('your error about delay $e')));
    print("delay start");
  }
}
