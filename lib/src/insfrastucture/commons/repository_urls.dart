class RepositoryUrls {
  RepositoryUrls._();

  static const String _baseUrl = 'localhost:3000';
  static const String _users = '/users';
  static const String _categories = '/categories';

  static Uri filterUsers(
          {required String userName, required String password}) =>
      Uri.http(_baseUrl, '$_users?username=$userName&password=$password');
  static Uri getUser = Uri.http(_baseUrl, _users);

  static Uri addUser = Uri.http(_baseUrl, _users);
  static Uri getCategories = Uri.http(_baseUrl, _categories);
  static Uri addCategories = Uri.http(_baseUrl, _categories);
}
