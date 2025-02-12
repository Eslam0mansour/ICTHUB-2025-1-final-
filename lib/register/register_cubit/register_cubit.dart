import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/core/networking/dio_base_client.dart';
import 'package:ict_final/main.dart';
import 'package:ict_final/register/models/user_model.dart';
import 'package:ict_final/register/register_cubit/auth_cubit_states.dart';

class RegisterCubit extends Cubit<AuthStates> {
  RegisterCubit() : super(AuthIntialState());
  bool isHidden = true;

  final baseClient = DioBaseClient();

  UserModel? userModel;

  //============================================== Create Register Method ===============================================================================
  // Register User Method
  Future<void> register({required Map<String, dynamic> data}) async {
    emit(RegisterLoadingState());
    try {
      // post request with dio
      Response response = await baseClient.dio.post(
        "signup",
        data: data,
      );
      userModel = UserModel.fromJson(json: response.data);
      log(response.data.toString());
      final preferences = await MySharedPreferences.preferences;

      preferences.setString(
        'token',
        response.data['access_token'],
      );
      emit(RegisterSuccessState());
    } catch (e) {
      emit(RegisterErrorState(errMsg: e.toString()));
    }
  }

  // ============================================== change password visibility method ================================================================
  void changePasswordVisibility() {
    isHidden = !isHidden;
    emit(PasswordVisibilyChanged());
  }
}
