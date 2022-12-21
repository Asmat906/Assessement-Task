import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import 'model/answer_response.dart';
import 'model/home_response.dart';

class ApiService {
  Future<HomeResponse?> getHomeResponse(int page) async {
    try {
      final Response response = await Dio().get(
          'https://api.stackexchange.com/2.3/questions?page=$page&order=desc&sort=activity&site=stackoverflow');
      print("response $page");
      if (response.statusCode == HttpStatus.ok) {
        return HomeResponse.fromJson(response.data);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  Future<AnswerResponse?> getAnswersResponse(int id) async {
    try {
      final Response response = await Dio().get(
          'https://api.stackexchange.com/2.3/answers/$id?order=desc&sort=activity&site=stackoverflow');

      if (response.statusCode == HttpStatus.ok) {
        return AnswerResponse.fromJson(response.data);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }
}
