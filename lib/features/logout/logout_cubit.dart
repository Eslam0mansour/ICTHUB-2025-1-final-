import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/core/networking/dio_base_client.dart';
import 'package:ict_final/core/utils/basic_state.dart';
import 'package:ict_final/core/utils/shared_pref.dart';
import 'package:ict_final/features/common/auth_state.dart';

class LogoutCubit extends Cubit<AuthState> {
  LogoutCubit({
    required this.baseClient,
    required this.prefs,
  }) : super(AuthState());

  final DioBaseClient baseClient;
  final MySharedPrefInterface prefs;

  Future<void> logout() async {
    emit(state.copyWith(status: BasicStates.loading));
    try {
      Response response = await baseClient.dio.post(
        "logout",
        options: Options(
          headers: {
            "Authorization":
                "Bearer ${prefs.getString(key: MySharedKeys.accessToken)}",
          },
        ),
      );
      if (response.statusCode == 204) {
        prefs.putString(
          key: MySharedKeys.accessToken,
          value: "",
        );
        emit(state.copyWith(status: BasicStates.success));
      } else {
        throw "Failed to logout";
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: BasicStates.error,
          errMsg: e.toString(),
        ),
      );
    }
  }
}
