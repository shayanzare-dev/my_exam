import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../../insfrastucture/commons/repository_urls.dart';
import '../models/details_view_model.dart';

class DetailsRepository {
  Future<Either<String, List<DetailsViewModel>>> getDetails(
      {required int categoryId}) async {
    int? statusCode;
    try {
      final http.Response response =
          await http.get(RepositoryUrls.getDetailsByCategoryId(categoryId: categoryId));
      statusCode = response.statusCode;
      final List<dynamic> jsonData = json.decode(response.body);
      if (statusCode == 200) {
         final List<DetailsViewModel> details = castData(jsonData);
        return Right(details);
      } else {
        return Left('wrong , status code => $statusCode');
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

  List<DetailsViewModel> castData(List<dynamic> jsonData) =>
      jsonData.map((json) => DetailsViewModel.fromJson(json: json)).toList();

  Future<Either<String, bool>> deleteDetail(
      {required int detailId}) async {
    int? statusCode;
    try {
      final http.Response response =
      await http.delete(RepositoryUrls.deleteDetail(detailId: detailId));
      statusCode = response.statusCode;
      if (statusCode == 200) {
        return const Right(true);
      } else {
        return Left('wrong , status code => $statusCode');
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
}
