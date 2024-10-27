import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:exam/src/pages/edit_item_deatels_page/models/edit_item_details_dto.dart';
import 'package:http/http.dart' as http;

import '../../../insfrastucture/commons/repository_urls.dart';
import '../../../insfrastucture/utils/utils.dart';
import '../models/edit_item_details_view_model.dart';

class EditDetailsRepository {
  Future<Either<String, EditItemDetailsViewModel>> getDetailById(
      {required int id}) async {
    int? statusCode;
    try {
      final http.Response response =
          await http.get(RepositoryUrls.getDetailById(id: id));
      statusCode = response.statusCode;
      final Map<String, dynamic> jsonData = json.decode(response.body);
      if (statusCode == 200) {
        final EditItemDetailsViewModel detail =
            EditItemDetailsViewModel.fromJson(json: jsonData);
        return Right(detail);
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

  Future<Either<String, Map<String, dynamic>>> editDetailById(
      {required int detailId,
      required EditItemDetailsDto editItemDetailDto}) async {
    int? statusCode;
    try {
      final String body = json.encode(editItemDetailDto.toJson());
      final http.Response response = await http.patch(
          RepositoryUrls.editDetailById(detailId: detailId),
          body: body,
          headers: Utils.headers);
      statusCode = response.statusCode;
      final Map<String, dynamic> jsonData = json.decode(response.body);
      if (statusCode == 200) {
        return Right(jsonData);
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
