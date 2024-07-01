import 'package:flutter_wabiz_client/model/category/category_model.dart';
import 'package:flutter_wabiz_client/service/category/category_api.dart';
import 'package:flutter_wabiz_client/service/category/category_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_repository.g.dart';

abstract interface class CategoryRepository {
  Future<CategoryModel> getCategoryProjects(String categoryId, String typeId);
  Future<CategoryModel> getProjectsByCategoryId(String categoryId);
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
}

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  final service = ref.watch(categoryApiServiceProvider);

  return CategoryRepositoryImpl(service);
}
