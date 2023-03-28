import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/user.dart';

class RegisterationAPI {
  final Dio dio;

  RegisterationAPI(this.dio);
  User? user;

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      final _storage = FlutterSecureStorage();
      final response = await Dio().post(
          "http://127.0.0.1:3000/api/v1/auth/email",
          options: Options(headers: {
            'Authorization':
                'Basic ${base64.encode(utf8.encode('defaultkey:'))}'
          }),
          queryParameters: {"create": false},
          data: {"email": email, "password": password});
      GamificationAPI.refreshToken = response.data["refresh_token"];
      GamificationAPI.accessToken = response.data["token"];
      _storage.write(key: "token", value: GamificationAPI.accessToken);
      _storage.write(key: "refresh_token", value: GamificationAPI.refreshToken);
      user = await getCurrentUser();

      return {
        "status": response.statusCode,
      };
    } on DioError catch (e) {
      print("error $e");
      return {
        "status": 401,
        "message": e.response!.data["message"],
      };
    } catch (e) {
      print("error $e");
      return {
        "status": 401,
        "message": e.toString(),
      };
    }
  }

  Future<Map<String, dynamic>> signup(
      String username, String email, String password) async {
    try {
      final _storage = FlutterSecureStorage();
      final response = await Dio().post(
          "http://127.0.0.1:3000/api/v1/auth/email",
          options: Options(headers: {
            'Authorization':
                'Basic ${base64.encode(utf8.encode('defaultkey:'))}'
          }),
          queryParameters: {"username": username, "create": true},
          data: {"email": email, "password": password});
      GamificationAPI.refreshToken = response.data["refresh_token"];
      GamificationAPI.accessToken = response.data["token"];
      _storage.write(key: "token", value: GamificationAPI.accessToken);
      _storage.write(key: "refresh_token", value: GamificationAPI.refreshToken);
      user = await getCurrentUser();
      return {
        "status": response.statusCode,
      };
    } on DioError catch (e) {
      print("error $e");
      return {
        "status": 401,
        "message": e.response!.data["message"],
      };
    } catch (e) {
      print("error $e");
      return {
        "status": 401,
        "message": e.toString(),
      };
    }
  }

  Future<User?> getCurrentUser() async {
    try {
      final storage = const FlutterSecureStorage();

      final response = await dio.get(
        "/user_accounts/fetch_account",
      );
      var map = Map<String, dynamic>.from(response.data);
      var user = User.fromJson(map);
      print(response.data);
      return user;
    } on DioError catch (e) {
      print("error $e");
      return null;
    } catch (e) {
      print("error $e");
      return null;
    }
  }
}
