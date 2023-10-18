import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:workiomtest/core/class/statusrequest.dart';
import 'package:workiomtest/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

//This class is organized for Request and Response on APİ

class Crud {
  Future<Either<StatusRequest, Map>> getData(String url) async {
    if (await checkInternet()) {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    late Map responsebody;
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        responsebody = jsonDecode(response.body);
        print(responsebody);
        return Right(responsebody);
      } else {
        responsebody = jsonDecode(response.body);
        print(responsebody);
        return Right(responsebody);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
