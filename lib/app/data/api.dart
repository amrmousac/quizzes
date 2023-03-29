import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' as getx;
import 'package:quizzes/app/data/Registeration.dart';
import 'package:quizzes/app/data/tournaments.dart';
import 'package:quizzes/app/models/user.dart';
import 'package:quizzes/app/routes/app_pages.dart';

class GamificationAPI {
  late Dio dio;
  late RegisterationAPI registerationAPI = RegisterationAPI(dio);
  late TournamentsAPI tournamentsAPI = TournamentsAPI(dio);

  static String? accessToken;
  static String? refreshToken;
  static User? user;

  final _storage = FlutterSecureStorage();

  GamificationAPI() {
    BaseOptions options = BaseOptions(
      baseUrl: "http://127.0.0.1:3000/api/v1/",
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers["Authorization"] = "Bearer $accessToken";
          options.headers['Access-Control-Allow-Origin'] = '*';
          options.headers['Access-Control-Allow-Methods'] =
              'GET, POST, OPTIONS, PUT, PATCH, DELETE';
          options.headers['Access-Control-Allow-Headers'] =
              'X-Requested-With,content-type';
          options.headers['Access-Control-Allow-Credentials'] = true;
          return handler.next(options);
        },
        onError: (e, handler) async {
          if (await _storage.containsKey(key: "refresh_token")) {
            await tokenRefresh();
            await registerationAPI.getCurrentUser();
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
        "http://127.0.0.1:7350/v2/account/session/refresh",
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
        await registerationAPI.getCurrentUser();
      } else {
        accessToken = null;
        _storage.deleteAll();
        getx.Get.toNamed(Routes.REGISTERATION);
      }
      print("token: $refreshToken");
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

  Future<bool> joinTournament() async {
    try {
      final response = await dio.post(
        "/tournament/join",
        queryParameters: {
          "tournamentId": "9465d094-93f7-4aaf-aa81-f4eb8f14b248",
        },
      );
      print(response.data);
      return true;
    } catch (e) {
      print("error $e");
      return false;
    }
  }
}
