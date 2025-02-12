import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ict_final/core/di/di.dart';
import 'package:ict_final/core/utils/bloc_observer.dart';
import 'package:ict_final/core/utils/shared_pref.dart';
import 'package:ict_final/features/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    /// Load .env file first to use it in the DioBaseClient
    await dotenv.load(fileName: '.env');

    /// Setup locator for singleton implementation
    /// Dio - DioBaseClient - MySharedPref
    await setupLocator();

    /// Initialize shared preference
    await locator<MySharedPrefInterface>().initSP();

    /// Bloc observer for debugging
    Bloc.observer = MyBlocObserver();

    runApp(FinalProject());
  } catch (e) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text('Error: $e'),
        ),
      ),
    ));
  }
}
