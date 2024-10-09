import 'package:exam/src/insfrastucture/route/route_names.dart';
import 'package:exam/src/insfrastucture/route/route_path.dart';
import 'package:exam/src/pages/category_page/commons/category_page_binding.dart';
import 'package:exam/src/pages/category_page/view/category_page.dart';
import 'package:exam/src/pages/insert_category_page/commons/insert_category_binding.dart';
import 'package:exam/src/pages/insert_category_page/view/insert_category_page.dart';
import 'package:exam/src/pages/item_deatels_page/commons/item_deatels_binding.dart';
import 'package:exam/src/pages/item_deatels_page/view/item_deatels_page.dart';
import 'package:exam/src/pages/spalsh_screen/view/splash_screen.dart';
import 'package:get/get.dart';

import '../../pages/edit_item_deatels_page/commons/edit_item_deatels_binding.dart';
import '../../pages/edit_item_deatels_page/view/edit_item_deatels_page.dart';
import '../../pages/insert_item_deatels_page/commons/insert_item_deatels_binding.dart';
import '../../pages/insert_item_deatels_page/view/insert_item_deatels_page.dart';
import '../../pages/login_page/commons/login_binding.dart';
import '../../pages/login_page/view/login_screen.dart';
import '../../pages/register_page/commons/splash_binding.dart';
import '../../pages/register_page/view/register_screen.dart';
import '../../pages/spalsh_screen/commons/splash_binding.dart';

class RoutePages {
  static List<GetPage> pages = [
    GetPage(
      name: RoutePath.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: RoutePath.login,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
        children: [
          GetPage(
            name: RoutePath.register,
            page: () => const RegisterScreen(),
            binding: RegisterBinding(),
          ),
        ]),
    GetPage(
      name: RouteNames.categoryPage,
      page: () => const CategoryPage(),
      binding: CategoryPageBinding(),
    ),
    GetPage(
      name: RouteNames.itemDeatelsPage,
      page: () => const ItemDeatelsPage(),
      binding: ItemDeatelsBinding(),
    ),
    GetPage(
      name: RouteNames.insertCategoryPage,
      page: () => const InsertCategoryPage(),
      binding: InsertCategoryBinding(),
    ),
    GetPage(
        name: RouteNames.editItemDeatelsPage,
        page: () => EditItemDeatelsPage(),
        binding: EditItemDeatelsBinding()),
    GetPage(
        name: RouteNames.insertItemDeatelsPage,
        page: () => InsertItemDeatelsPage(),
        binding: InsertItemDeatelsBinding()),
  ];
}