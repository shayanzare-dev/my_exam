import 'route_path.dart';

class RouteNames {
  static const String splashScreen = RoutePath.splashScreen;
  static const String login = RoutePath.login;
  static const String register = '${RoutePath.login}${RoutePath.register}';
  static const String categoryPage = RoutePath.categoryPage;

  static const String insertCategoryPage =
      '${RoutePath.categoryPage}${RoutePath.insertCategoryPage}';
  static const String itemDetailsPage =
      '${RoutePath.categoryPage}${RoutePath.itemDetailsPage}';
  static const String insertItemDetailsPage =
      '${RoutePath.categoryPage}${RoutePath.itemDetailsPage}${RoutePath.insertItemDetailsPage}';
  static const String editItemDetailsPage =
      '${RoutePath.categoryPage}${RoutePath.itemDetailsPage}${RoutePath.editItemDetailsPage}';
}
