import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:quizzes/app/data/api.dart';
import 'package:quizzes/app/models/group.dart';
import 'package:quizzes/app/models/group_user.dart';
import 'package:quizzes/app/utils/resources/constants_manager.dart';

class GroupsAPI {
  final Dio dio;

  GroupsAPI(this.dio);
  Future<List<Group>> getUserGroups() async {
    try {
      if (GamificationAPI.user.value?.user.id != null) {
        final response = await Dio().get(
          "http://${AppConstants.baseUrl}:7350/v2/user/${GamificationAPI.user.value?.user.id}/group",
          options: Options(headers: {
            'Authorization': 'Bearer ${GamificationAPI.accessToken}'
          }),
        );
        final lst = (response.data["user_groups"] as List?)?.map((e) {
          return Group.fromJson(e);
        }).toList();
        return lst ?? [];
      }
      return <Group>[];
    } on DioError catch (e) {
      print("error $e");
      return <Group>[];
    } catch (e) {
      return <Group>[];
    }
  }

  Future<List<GroupUser>> getGroupUsers(String groupId) async {
    try {
      if (GamificationAPI.user.value?.user.id != null) {
        final response = await dio.get(
          "groups/listUsers",
          queryParameters: {"groupId": groupId},
        );
        final lst = (response.data["group_users"] as List).map((e) {
          return GroupUser.fromJson(e);
        }).toList();
        return lst;
      }
      return <GroupUser>[];
    } on DioError catch (e) {
      print("error $e");
      return <GroupUser>[];
    } catch (e) {
      return <GroupUser>[];
    }
  }
}
