import 'route_path.dart';

class RouteNames {
  static const String splashScreen = RoutePath.splashScreen;
  static const String login = RoutePath.login;
  static const String register = '${RoutePath.login}${RoutePath.register}';
  static const String categoryPage = RoutePath.categoryPage;

  static const String insertCategoryPage = RoutePath.insertCategoryPage;
  static const String itemDeatelsPage = RoutePath.itemDeatelsPage;
  static const String insertItemDeatelsPage = RoutePath.insertItemDeatelsPage;
  static const String editItemDeatelsPage = RoutePath.editItemDeatelsPage;
}
