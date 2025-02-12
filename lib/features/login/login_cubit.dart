import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/core/networking/dio_base_client.dart';
import 'package:ict_final/core/utils/basic_state.dart';
import 'package:ict_final/core/utils/shared_pref.dart';
import 'package:ict_final/features/common/auth_state.dart';

class LoginCubit extends Cubit<AuthState> {
  LoginCubit({
    required this.baseClient,
    required this.prefs,
  }) : super(AuthState());
  final DioBaseClient baseClient;
  final MySharedPrefInterface prefs;

  Future<void> login({required Map<String, dynamic> data}) async {
    emit(state.copyWith(status: BasicStates.loading));
    try {
      Response response = await baseClient.dio.post(
        "token?grant_type=password",
        data: data,
      );

      prefs.putString(
        key: MySharedKeys.accessToken,
        value: response.data['access_token'],
      );

      emit(state.copyWith(status: BasicStates.success));
    } on DioException catch (e) {
      emit(
        state.copyWith(
          status: BasicStates.error,
          errMsg: e.response?.data['msg'] ?? e.message ?? e.error.toString(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BasicStates.error,
          errMsg: e.toString(),
        ),
      );
    }
  }

  void changePasswordVisibility() {
    emit(state.copyWith(isHidden: !state.isHidden));
  }
}
