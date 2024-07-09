import 'package:flutter_wabiz_client/service/project/project_api.dart';
import 'package:flutter_wabiz_client/service/project/project_api_service.dart';
import 'package:flutter_wabiz_client/shared/model/response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/project/project_model.dart';
import '../../model/project/reward_model.dart';

part 'project_repository.g.dart';

abstract interface class ProjectRepository {
  Future<ResponseModel> createProject(
    ProjectItemModel body,
  );

  Future<ResponseModel?> updateProjectOpenState(
    String id,
    ProjectItemModel body,
  );

  Future<ResponseModel?> deleteProject(
    String id,
  );

  Future<ResponseModel?> createProjectReward(
    String id,
    RewardItemModel body,
  );

  Future<ProjectModel> getProjectsByUserId(
    String userId,
  );
}

class ProjectRepositoryImpl implements ProjectRepository {
  ProjectRepositoryImpl(this.projectApi);
  final ProjectApi projectApi;

  @override
  Future<ResponseModel> createProject(ProjectItemModel body) async {
    final result = await projectApi.createProject(body);

    return result;
  }

  @override
  Future<ResponseModel?> updateProjectOpenState(
      String id, ProjectItemModel body) async {
    final result = await projectApi.updateProjectOpenState(id, body);

    return result;
  }

  @override
  Future<ResponseModel?> deleteProject(String id) async {
    final result = await projectApi.deleteProject(id);

    return result;
  }

  @override
  Future<ResponseModel?> createProjectReward(
      String id, RewardItemModel body) async {
    final result = await projectApi.createProjectReward(id, body);

    return result;
  }

  @override
  Future<ProjectModel> getProjectsByUserId(String userId) async {
    final result = await projectApi.getProjectByUserId(userId);

    return result;
  }
}

@riverpod
ProjectRepository projectRepository(ProjectRepositoryRef ref) {
  final projectApi = ref.watch(projectApiServiceProvider);

  return ProjectRepositoryImpl(projectApi);
}
