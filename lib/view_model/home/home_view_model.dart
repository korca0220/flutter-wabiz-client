import 'package:dio/dio.dart';
import 'package:flutter_wabiz_client/model/home/home_model.dart';
import 'package:flutter_wabiz_client/repository/home/home_repository.dart';
import 'package:flutter_wabiz_client/shared/model/project_category.dart';
import 'package:flutter_wabiz_client/views/home/home_page.dart';
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
  } on DioException catch (e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        throw ConnectionTimeoutError(e);
      case DioExceptionType.connectionError:
        throw ConnectionError(e);
      default:
    }

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
      iconPath: "assets/icons/categories/1.png",
      title: "펀딩+",
    ),
    ProjectCategory(
      id: 5,
      iconPath: "assets/icons/categories/5.png",
      title: "혜택",
    ),
    ProjectCategory(
      id: 2,
      iconPath: "assets/icons/categories/2.png",
      title: "오픈예정",
    ),
    ProjectCategory(
      id: 6,
      iconPath: "assets/icons/categories/6.png",
      title: "펀딩체험단",
    ),
    ProjectCategory(
      id: 3,
      iconPath: "assets/icons/categories/3.png",
      title: "스토어",
    ),
    ProjectCategory(
      id: 7,
      iconPath: "assets/icons/categories/7.png",
      title: "뷰티워크",
    ),
    ProjectCategory(
      id: 4,
      iconPath: "assets/icons/categories/4.png",
      title: "예약구매",
    ),
    ProjectCategory(
      id: 8,
      iconPath: "assets/icons/categories/8.png",
      title: "새학기출발",
    ),
    ProjectCategory(
      id: 5,
      iconPath: "assets/icons/categories/5.png",
      title: "혜택",
    ),
    ProjectCategory(
      id: 9,
      iconPath: "assets/icons/categories/9.png",
      title: "클래스수강",
    ),
  ];

  return categories;
}
