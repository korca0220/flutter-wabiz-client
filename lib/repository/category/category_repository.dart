import 'package:flutter_wabiz_client/model/category/category_model.dart';
import 'package:flutter_wabiz_client/service/category/category_api.dart';
import 'package:flutter_wabiz_client/service/category/category_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/model/project_type.dart';

part 'category_repository.g.dart';

abstract interface class CategoryRepository {
  Future<CategoryModel> getCategoryProjects(String categoryId, String typeId);
  Future<CategoryModel> getProjectsByCategoryId(String categoryId);
  List<ProjectType> getProjectTypes();
}

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl(this.categoryApi);

  CategoryApi categoryApi;

  @override
  Future<CategoryModel> getCategoryProjects(
      String categoryId, String typeId) async {
    final result =
        await categoryApi.getProjectByProjectType(categoryId, typeId);

    return result;
  }

  @override
  Future<CategoryModel> getProjectsByCategoryId(String categoryId) async {
    final result = await categoryApi.getProjectByCategoryId(categoryId);

    return result;
  }

  @override
  List<ProjectType> getProjectTypes() {
    List<ProjectType> defaultType = [
      ProjectType(id: 1, type: "테크가전", imagePath: "assets/icons/type/1.svg"),
      ProjectType(id: 2, type: "패션", imagePath: "assets/icons/type/2.svg"),
      ProjectType(id: 3, type: "뷰티", imagePath: "assets/icons/type/3.svg"),
      ProjectType(id: 4, type: "홈리빙", imagePath: "assets/icons/type/4.svg"),
      ProjectType(id: 5, type: "스포츠아웃도어", imagePath: "assets/icons/type/5.svg"),
      ProjectType(id: 6, type: "푸드", imagePath: "assets/icons/type/6.svg"),
      ProjectType(id: 7, type: "도서전자책", imagePath: "assets/icons/type/7.svg"),
      ProjectType(id: 8, type: "클래스", imagePath: "assets/icons/type/8.svg"),
    ];
    return [
      ProjectType(id: 0, type: "전체", imagePath: "assets/icons/type/all.svg"),
      ProjectType(
          id: 0, type: "BEST 펀딩", imagePath: "assets/icons/type/best.svg"),
      ...defaultType,
    ];
  }
}

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  final service = ref.watch(categoryApiServiceProvider);

  return CategoryRepositoryImpl(service);
}
