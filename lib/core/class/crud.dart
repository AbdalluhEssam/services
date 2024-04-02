import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:services/core/class/statusrequest.dart';
import 'package:services/core/functions/checkinterner.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkUrl, Map data) async {
      try{
        if (await checkInternet()) {
          var response = await http.post(Uri.parse(linkUrl), body: data);
          log(response.statusCode.toString());
          if (response.statusCode == 200 || response.statusCode == 201) {
            Map responseBody = jsonDecode(response.body);
            log(responseBody.toString());
            return Right(responseBody);
          } else {
            return const Left(StatusRequest.serverFailure);
          }
        } else {
          return const Left(StatusRequest.offlineFailure);
        }
      }catch(_){
        return const Left(StatusRequest.serverFailure);
      }
  }
}
