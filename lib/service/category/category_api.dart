import 'package:dio/dio.dart';
import 'package:flutter_wabiz_client/model/category/category_model.dart';
import 'package:retrofit/retrofit.dart';

part 'category_api.g.dart';

@RestApi(baseUrl: "http://localhost:3000/api/v1")
abstract class CategoryApi {
  factory CategoryApi(Dio dio, {String baseUrl}) = _CategoryApi;

  @GET("/category/{categoryId}")
  Future<CategoryModel> getProjectByCategoryId(
    @Path() String? categoryId,
  );

  @GET("/category/{categoryId}/{projectTypeId}")
  Future<CategoryModel> getProjectByProjectType(
    @Path() String? categoryId,
    @Path() String? projectTypeId,
  );
}
