import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;

import '../../../insfrastucture/commons/repository_urls.dart';
import '../../../insfrastucture/utils/utils.dart';
import '../models/item_details_dto.dart';

class InsertItemDetailsRepository {
  Future<Either<String, Map<String, dynamic>>> addItemDetail(
      {required final ItemDetailsDto itemDetailsDto}) async {
    int? statusCode;
    try {
      final String body = json.encode(itemDetailsDto.toJson());
      final http.Response response = await http.post(
          RepositoryUrls.addItemDetail,
          body: body,
          headers: Utils.headers);
      statusCode = response.statusCode;
      if (statusCode == 201) {
        final Map<String, dynamic> result = json.decode(response.body);
        return Right(result);
      } else {
        return Left('not successfully , status code : $statusCode');
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
