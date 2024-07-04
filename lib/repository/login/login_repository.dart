import 'package:flutter_wabiz_client/model/login/login_model.dart';
import 'package:flutter_wabiz_client/shared/model/response_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../service/login/login_api.dart';
import '../../service/login/login_api_service.dart';

part 'login_repository.g.dart';

abstract class LoginRepository {
  Future<ResponseModel> signUp(LoginModel body);
  Future<ResponseModel> checkEmail(LoginModel body);
}

final class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this.loginApiService);

  final LoginApi loginApiService;

  @override
  Future<ResponseModel> signUp(LoginModel body) async {
    final result = await loginApiService.signUp(body);

    return result;
  }

  @override
  Future<ResponseModel> checkEmail(LoginModel body) async {
    final result = await loginApiService.checkEmail(body);

    return result;
  }
}

@Riverpod(keepAlive: true)
LoginRepository loginRepository(LoginRepositoryRef ref) {
  final service = ref.watch(loginApiServiceProvider);

  return LoginRepositoryImpl(service);
}
