import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_rx/get_rx.dart';
import 'package:quizzes/app/data/Registeration.dart';
import 'package:quizzes/app/data/groups.dart';
import 'package:quizzes/app/data/tournaments.dart';
import 'package:quizzes/app/models/user.dart';
import 'package:quizzes/app/routes/app_pages.dart';
import 'package:quizzes/app/utils/resources/constants_manager.dart';

class GamificationAPI {
  late Dio dio;
  late RegisterationAPI registerationAPI = RegisterationAPI(dio);
  late TournamentsAPI tournamentsAPI = TournamentsAPI(dio);
  late GroupsAPI groupsAPI = GroupsAPI(dio);

  static String? accessToken;
  static String? refreshToken;
  static final user = Rx<User?>(null);

  final _storage = FlutterSecureStorage();

  GamificationAPI() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://${AppConstants.baseUrl}:5000/api/v1/",
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers["Authorization"] = "Bearer $accessToken";
          // options.headers['Access-Control-Allow-Origin'] = '*';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (e, handler) async {
          // return handler.next(e);
          if (accessToken != null) {
            await tokenRefresh();
            await Future.delayed(Duration(seconds: 5));
            return handler.resolve(await _retry(e.requestOptions));
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<void> tokenRefresh() async {
    try {
      final refToken = await _storage.read(key: "refresh_token");
      final response = await Dio().post(
        "http://${AppConstants.baseUrl}:7350/v2/account/session/refresh",
        options: Options(headers: {
          'Authorization': 'Basic ${base64.encode(utf8.encode('defaultkey:'))}'
        }),
        data: {
          "token": refToken,
        },
      );
      if (response.statusCode == 200) {
        refreshToken = response.data["refresh_token"];
        accessToken = response.data["token"];
        _storage.write(key: "token", value: accessToken);
        _storage.write(key: "refresh_token", value: refreshToken);
      } else {
        accessToken = null;
        _storage.deleteAll();
        getx.Get.toNamed(Routes.REGISTERATION);
      }
      print("refreshToken: $refreshToken");
      print("token: $accessToken");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }
}
