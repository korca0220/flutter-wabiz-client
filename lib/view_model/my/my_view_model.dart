import 'package:flutter_wabiz_client/model/login/login_model.dart';
import 'package:flutter_wabiz_client/model/project/project_model.dart';
import 'package:flutter_wabiz_client/repository/my/my_repository.dart';
import 'package:flutter_wabiz_client/view_model/login/login_view_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'my_view_model.freezed.dart';
part 'my_view_model.g.dart';

@freezed
class MyPageState with _$MyPageState {
  factory MyPageState({
    bool? loginState,
    LoginModel? loginModel,
  }) = _MyPageState;

  factory MyPageState.fromJson(Map<String, dynamic> json) =>
      _$MyPageStateFromJson(json);
}

@riverpod
class MyPageViewModel extends _$MyPageViewModel {
  @override
  MyPageState build() {
    final state = ref.watch(loginViewModelProvider);

    return MyPageState(
      loginState: state.isLogin,
      loginModel: LoginModel(
        email: state.email,
        password: state.password,
        id: state.userId,
      ),
    );
  }

  Future<List<ProjectItemModel>> fetchUserProjects() async {
    final userId = state.loginModel?.id;

    final result = await ref
        .watch(myRepositoryProvider)
        .getProjectsByUserId(userId.toString());

    return result.data;
  }

  Future<bool> updateProject(String id, ProjectItemModel body) async {
    final result =
        await ref.watch(myRepositoryProvider).updateProjectOpenState(id, body);

    if (result.status == "ok") return true;

    return false;
  }

  Future<bool> deleteProject(String id) async {
    final result = await ref.watch(myRepositoryProvider).deleteProject(id);

    if (result.status == "ok") return true;

    return false;
  }
}
