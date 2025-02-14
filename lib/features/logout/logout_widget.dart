import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_final/core/di/di.dart';
import 'package:ict_final/core/networking/dio_base_client.dart';
import 'package:ict_final/core/utils/basic_state.dart';
import 'package:ict_final/core/utils/shared_pref.dart';
import 'package:ict_final/features/common/auth_state.dart';
import 'package:ict_final/features/login/login_screen.dart';
import 'package:ict_final/features/logout/logout_cubit.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(
        baseClient: locator<DioBaseClient>(),
        prefs: locator<MySharedPrefInterface>(),
      ),
      child: BlocConsumer<LogoutCubit, AuthState>(
        listener: (context, state) {
          if (state.status.isSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          } else if (state.status.isError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errMsg ?? "Error",
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              context.read<LogoutCubit>().logout();
            },
            child: state.status.isLoading
                ? CircularProgressIndicator()
                : Text("logout"),
          );
        },
      ),
    );
  }
}
