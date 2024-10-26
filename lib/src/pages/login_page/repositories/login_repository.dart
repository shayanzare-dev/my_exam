import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:exam/src/insfrastucture/commons/repository_urls.dart';
import 'package:http/http.dart' as http;

import '../models/user_view_model.dart';

class LoginRepository {
  Future<Either<String, List<UserViewModel>>> getUsers() async {
    int? statusCode;
    try {
      final http.Response response = await http.get(RepositoryUrls.getUser);
      final List<dynamic> jsonData = json.decode(response.body);
      statusCode = response.statusCode;
      if (statusCode == 200) {
        final List<UserViewModel> users = castData(jsonData);
        print('left is right ');
        return Right(users);
      } else {
        print('left is runnig ');
        return Left('status code => $statusCode');
      }
    } on SocketException {
      return const Left('there is\'nt connect to the internet');
    } on HttpException {
      return const Left('error for send request to server');
    } on FormatException {
      return const Left('received invalid response from the internet');
    } catch (e) {
      return Left(
          'something went wrong status code: $statusCode , error-> ${e.toString()}');
    }
  }

  List<UserViewModel> castData(List<dynamic> jsonData) =>
      jsonData.map((json) => UserViewModel.fromJson(json: json)).toList();
}
