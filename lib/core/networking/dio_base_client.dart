import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioBaseClient {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://ioxfajusqcjuzjdjilsh.supabase.co/auth/v1/",
      headers: {
        "apikey":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlveGZhanVzcWNqdXpqZGppbHNoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkxMjgwNzIsImV4cCI6MjA1NDcwNDA3Mn0.w-ze172jYa_4f6GgEKs24rEOr2CipzkiaacSQaMAklc"
      },
    ),
  )..interceptors.add(PrettyDioLogger(
      requestBody: true,
    ));
}
