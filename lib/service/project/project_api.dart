import 'package:dio/dio.dart';
import 'package:flutter_wabiz_client/model/project/reward_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/project/project_model.dart';
import '../../shared/model/response_model.dart';

part 'project_api.g.dart';

@RestApi(baseUrl: "http://localhost:3000/api/v1")
abstract class ProjectApi {
  factory ProjectApi(Dio dio, {String baseUrl}) = _ProjectApi;

  @POST("/project")
  Future<ResponseModel> createProject(
    @Body() ProjectItemModel body,
  );

  @PUT("/project/{id}")
  Future<ResponseModel> updateProjectOpenState(
    @Path() String id,
    @Body() ProjectItemModel body,
  );

  @DELETE("/project/{id}")
  Future<ResponseModel> deleteProject(
    @Path() String id,
  );

  @GET("/project/user/{userId}")
  Future<ProjectModel> getProjectByUserId(
    @Path() String userId,
  );

  @POST('/project/reward/{id}')
  Future<ResponseModel> createProjectReward(
    @Path() String id,
    @Body() RewardItemModel body,
  );

  @GET('/project/{id}')
  Future<ProjectModel> getProjectById(
    @Path() String id,
  );
}
