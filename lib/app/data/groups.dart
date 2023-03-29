import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/group.dart';

class GroupsAPI {
  final Dio dio;

  GroupsAPI(this.dio);
  Future<List<Group>> getUserGroups() async {
    try {
      if (GamificationAPI.user.value?.user.id != null) {
        final response = await Dio().get(
          "http://127.0.0.1:7350/v2/user/${GamificationAPI.user.value?.user.id}/group",
          options: Options(headers: {
            'Authorization': 'Bearer ${GamificationAPI.accessToken}'
          }),
        );
        final lst = (response.data["user_groups"] as List).map((e) {
          return Group.fromJson(e);
        }).toList();
        return lst;
      }
      return <Group>[];
    } on DioError catch (e) {
      print("error $e");
      return <Group>[];
    } catch (e) {
      return <Group>[];
    }
  }
}
