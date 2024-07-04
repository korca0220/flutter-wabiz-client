import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/login/login_model.dart';
import '../../shared/model/response_model.dart';

part 'login_api.g.dart';

@RestApi(baseUrl: "http://localhost:3000/api/v1")
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST("/signup")
  Future<ResponseModel> login(
    @Body() LoginModel loginModel,
  );
}
