import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../../insfrastucture/commons/repository_urls.dart';
import '../../../insfrastucture/utils/utils.dart';
import '../models/category_dto.dart';
import '../models/category_view_model.dart';

class CategoryRepository {
  Future<Either<String, List<CategoryViewModel>>> getCategories() async {
    int? statusCode;
    try {
      final http.Response response =
          await http.get(RepositoryUrls.getCategories);
      statusCode = response.statusCode;
      final List<dynamic> jsonData = json.decode(response.body);
      if (statusCode == 200) {
        final List<CategoryViewModel> categories = castData(jsonData);
        return Right(categories);
      } else {
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

  Future<Either<String, Map<String,dynamic>>> editCategory(
      {required int categoryId, required CategoryDto categoryDto}) async {
    int? statusCode;
    try {
      final String body = json.encode(categoryDto.toJson());
      final http.Response response = await http.patch(
          RepositoryUrls.editCategory(id: categoryId),
          body: body,
          headers: Utils.headers);
      statusCode = response.statusCode;
      final Map<String, dynamic> jsonData = json.decode(response.body);
      if (statusCode == 200) {
        return Right(jsonData);
      } else {
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

  List<CategoryViewModel> castData(List<dynamic> jsonData) =>
      jsonData.map((json) => CategoryViewModel.fromJson(json: json)).toList();
}
