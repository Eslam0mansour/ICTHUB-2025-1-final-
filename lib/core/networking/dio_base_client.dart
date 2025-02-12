import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioBaseClient {
  final Dio dio;

  DioBaseClient(
    this.dio,
  ) {
    dio
      ..options.baseUrl = "https://ioxfajusqcjuzjdjilsh.supabase.co/auth/v1/"
      ..options.headers = {
        "apikey": dotenv.env["SUPABASE_API_KEY"],
      }
      ..interceptors.add(
        PrettyDioLogger(
          requestBody: true,
        ),
      );
  }
}
