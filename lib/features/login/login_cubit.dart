import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/core/networking/dio_base_client.dart';
import 'package:ict_final/main.dart';
import 'package:ict_final/register/models/user_model.dart';
import 'package:ict_final/register/register_cubit/auth_cubit_states.dart';

class LoginCubit extends Cubit<AuthStates> {
  LoginCubit() : super(AuthIntialState());
  final baseClient = DioBaseClient();

  // UserModel
  UserModel? userModel;

  // Login User Method
  Future<void> login({required Map<String, dynamic> data}) async {
    emit(LoginLoadingState());
    try {
      // post request with dio
      Response response = await baseClient.dio.post(
        "token?grant_type=password",
        data: data,
      );
      log(response.data.toString());
      userModel = UserModel.fromJson(json: response.data);
      log("User name is ${userModel?.name}");
      log("Access Token is ${userModel?.accessToken}");
      final preferences = await MySharedPreferences.preferences;

      preferences.setString(
        'token',
        response.data['access_token'],
      );
      emit(LoginSuccessState());
    } on DioException catch (e) {
      emit(
        LoginErrorState(
          errMsg: e.response?.data['msg'] ?? e.message ?? e.error.toString(),
        ),
      );
    } catch (e) {
      emit(
        LoginErrorState(
          errMsg: e.toString(),
        ),
      );
    }
  }

  bool isHidden = true;

  // ============================================== change password visibility method ================================================================
  void changePasswordVisibility() {
    isHidden = !isHidden;
    emit(PasswordVisibilyChanged());
  }
}
