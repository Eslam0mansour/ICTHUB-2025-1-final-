import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/core/networking/dio_base_client.dart';
import 'package:ict_final/features/common/auth_cubit_states.dart';
import 'package:ict_final/main.dart';

class LogoutCubit extends Cubit<AuthStates> {
  LogoutCubit() : super(AuthIntialState());

  final baseClient = DioBaseClient();

//============================================== Create Logout Method ===============================================================================

  Future<void> logout() async {
    emit(LogoutLoadingState());
    try {
      final preferences = await MySharedPreferences.preferences;
      Response response = await baseClient.dio.post(
        "logout",
        options: Options(
          headers: {
            "Authorization": "Bearer ${preferences.getString('token')}"
          },
        ),
      );
      if (response.statusCode == 204) {
        preferences.setString(
          'token',
          '',
        );
        emit(LogoutSuccessState());
      } else {
        throw "Failed to logout";
      }
    } catch (e) {
      emit(LogoutErrorState(errMsg: e.toString()));
    }
  }
}
