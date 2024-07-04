import 'dart:convert';

import 'package:flutter_wabiz_client/shared/model/response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/login/login_model.dart';
import '../../repository/login/login_repository.dart';

part 'login_view_model.freezed.dart';
part 'login_view_model.g.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isLogin,
    int? userId,
    String? email,
    String? password,
    String? username,
  }) = _LoginState;

  factory LoginState.init() {
    return LoginState(
      isLogin: false,
      userId: 0,
      email: "",
      password: "",
      username: "",
    );
  }
}

@Riverpod(keepAlive: true)
class LoginViewModel extends _$LoginViewModel {
  @override
  LoginState build() {
    return LoginState.init();
  }

  Future<bool> signUp(LoginModel body) async {
    final result = await ref.watch(loginRepositoryProvider).signUp(body);

    if (result.status == "ok") {
      return true;
    }

    return false;
  }

  Future<ResponseModel?> signIn(String email, String password) async {
    final result = await ref.watch(loginRepositoryProvider).signIn(
          LoginModel(
            email: email,
            password: password,
          ),
        );

    if (result != null) {
      final data = LoginModel.fromJson(jsonDecode(result.body ?? ""));

      state = state.copyWith(
        isLogin: true,
        userId: data.id,
        email: data.email,
        password: data.password,
        username: data.username,
      );
    }

    return result;
  }

  Future<bool> checkEmail(LoginModel body) async {
    final result = await ref.watch(loginRepositoryProvider).checkEmail(body);

    if (result.status == "ok") {
      return true;
    }

    return false;
  }
}
