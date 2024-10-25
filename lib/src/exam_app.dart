import 'package:exam/src/insfrastucture/routes/route_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'insfrastucture/routes/route_names.dart';

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: 'exam app',
        initialRoute: RouteNames.splashScreen,
        getPages: RoutePage.pages,
      );
}
