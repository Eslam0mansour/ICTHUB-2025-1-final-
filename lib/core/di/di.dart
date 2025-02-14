import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ict_final/core/networking/dio_base_client.dart';
import 'package:ict_final/core/utils/shared_pref.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  ///Dio
  locator.registerLazySingleton<Dio>(() => Dio());

  /// DioBaseClient
  locator.registerLazySingleton<DioBaseClient>(
    () => DioBaseClient(locator<Dio>()),
  );

  /// SharedPref
  locator.registerLazySingleton<MySharedPrefInterface>(
    () => MySharedPref(),
  );
}
