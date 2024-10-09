import 'package:exam/src/insfrastucture/route/route_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'insfrastucture/route/route_path.dart';

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'exam app',
      initialRoute: RoutePath.splashScreen,
      getPages: RoutePages.pages,
    );
  }
}
