import 'package:flutter_wabiz_client/model/project/project_model.dart';
import 'package:flutter_wabiz_client/service/project/project_api.dart';
import 'package:flutter_wabiz_client/service/project/project_api_service.dart';
import 'package:flutter_wabiz_client/shared/model/response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_repository.g.dart';

@riverpod
MyRepositoryImpl myRepository(MyRepositoryRef ref) {
  final projectApi = ref.watch(projectApiServiceProvider);

  return MyRepositoryImpl(projectApi: projectApi);
}

abstract interface class MyRepository {
  Future<ProjectModel> getProjectsByUserId(String userId);

  Future<ResponseModel> deleteProject(String id);

  Future updateProjectOpenState(String id, ProjectItemModel body);
}

class MyRepositoryImpl implements MyRepository {
  MyRepositoryImpl({required this.projectApi});

  final ProjectApi projectApi;
  @override
  Future<ResponseModel> deleteProject(String id) async {
    final result = await projectApi.deleteProject(id);

    return result;
  }

  @override
  Future<ProjectModel> getProjectsByUserId(String userId) async {
    final result = await projectApi.getProjectByUserId(userId);

    return result;
  }

  @override
  Future updateProjectOpenState(String id, ProjectItemModel body) async {
    final result = await projectApi.updateProjectOpenState(id, body);

    return result;
  }
}
