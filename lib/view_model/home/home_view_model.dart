import 'package:flutter_wabiz_client/model/home/home_model.dart';
import 'package:flutter_wabiz_client/repository/home/home_repository.dart';
import 'package:flutter_wabiz_client/shared/model/project_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.freezed.dart';
part 'home_view_model.g.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({@Default([]) List<HomeItemModel> projects}) = _HomeState;
}

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState? build() {
    return null;
  }

  update(List<HomeItemModel> projects) {
    state = state?.copyWith(projects: [...projects]);
  }

  Future<HomeModel?> fetchHomeData() async {
    final result = await ref.watch(homeRepositoryProvider).getHomeProjects();

    update(result.projects);

    return result;
  }
}

@riverpod
Future<HomeModel> fetchHomeProject(FetchHomeProjectRef ref) async {
  try {
    final result =
        await ref.watch(homeViewModelProvider.notifier).fetchHomeData();

    return result ?? const HomeModel();
  } catch (e) {
    return const HomeModel();
  }
}

@riverpod
Future<List<ProjectCategory>> fetchHomeCategories(
    FetchHomeCategoriesRef ref) async {
  await Future.delayed(const Duration(milliseconds: 2000));

  List<ProjectCategory> categories = [
    ProjectCategory(
      id: 1,
      title: "펀딩+",
      iconPath: "assets/icons/categories/1.png",
    ),
    ProjectCategory(
      id: 2,
      title: "오픈예정",
      iconPath: "assets/icons/categories/2.png",
    ),
    ProjectCategory(
      id: 3,
      title: "인기",
      iconPath: "assets/icons/categories/3.png",
    ),
    ProjectCategory(
      id: 4,
      title: "최신",
      iconPath: "assets/icons/categories/4.png",
    ),
    ProjectCategory(
      id: 5,
      title: "마감임박",
      iconPath: "assets/icons/categories/5.png",
    ),
    ProjectCategory(
      id: 6,
      title: "테마",
      iconPath: "assets/icons/categories/6.png",
    ),
    ProjectCategory(
      id: 7,
      title: "펀딩중",
      iconPath: "assets/icons/categories/7.png",
    ),
    ProjectCategory(
      id: 8,
      title: "펀딩성공",
      iconPath: "assets/icons/categories/8.png",
    ),
    ProjectCategory(
      id: 9,
      title: "펀딩실패",
      iconPath: "assets/icons/categories/9.png",
    ),
  ];

  return categories;
}
