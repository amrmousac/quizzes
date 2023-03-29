import 'package:get/get.dart';

import '../modules/groups/bindings/groups_binding.dart';
import '../modules/groups/views/groups_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/play/bindings/play_binding.dart';
import '../modules/play/views/play_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/quize/bindings/quize_binding.dart';
import '../modules/quize/views/quize_view.dart';
import '../modules/ranking/bindings/ranking_binding.dart';
import '../modules/ranking/views/ranking_view.dart';
import '../modules/registeration/bindings/registeration_binding.dart';
import '../modules/registeration/views/registeration_view.dart';
import '../modules/singleGroup/bindings/single_group_binding.dart';
import '../modules/singleGroup/views/single_group_view.dart';
import '../modules/tournaments/bindings/tournaments_binding.dart';
import '../modules/tournaments/views/tournaments_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.RANKING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTERATION,
      page: () => const RegisterationView(),
      binding: RegisterationBinding(),
    ),
    GetPage(
      name: _Paths.PLAY,
      page: () => const PlayView(),
      binding: PlayBinding(),
    ),
    GetPage(
      name: _Paths.TOURNAMENTS,
      page: () => const TournamentsView(),
      binding: TournamentsBinding(),
    ),
    GetPage(
      name: _Paths.GROUPS,
      page: () => const GroupsView(),
      binding: GroupsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.QUIZE,
      page: () => const QuizeView(),
      binding: QuizeBinding(),
    ),
    GetPage(
      name: _Paths.SINGLE_GROUP,
      page: () => const SingleGroupView(),
      binding: SingleGroupBinding(),
    ),
    GetPage(
      name: _Paths.RANKING,
      page: () => const RankingView(),
      binding: RankingBinding(),
    ),
  ];
}
