class RepositoryUrls {
  RepositoryUrls._();

  static const String _baseUrl = 'localhost:3000';
  static const String _users = '/users';
  static const String _categories = '/categories';
  static const String _details = '/details';

  static Uri getUser({
    required String userName,
    required String password,
  }) =>
      Uri.parse(
          'http://localhost:3000/users?userName=$userName&password=$password');

  static Uri addUser = Uri.http(_baseUrl, _users);
  static Uri getCategories = Uri.http(_baseUrl, _categories);
  static Uri addCategories = Uri.http(_baseUrl, _categories);

  static Uri getDetailsByCategoryId({required int categoryId}) =>
      Uri.parse('http://localhost:3000/details?categoryId=$categoryId');

  static Uri getDetailById({required int id}) =>
      Uri.http(_baseUrl, '$_details/$id');

  static Uri deleteDetail({required int detailId}) =>
      Uri.http(_baseUrl, '$_details/$detailId');
  static Uri editDetailById({required int detailId}) =>
      Uri.http(_baseUrl, '$_details/$detailId');
  static Uri addItemDetail = Uri.http(_baseUrl, _details);
}
