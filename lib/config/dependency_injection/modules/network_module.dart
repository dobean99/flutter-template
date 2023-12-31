// ignore_for_file: do_not_use_environment
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @Named('BaseUrl')
  String get baseHttpUrl => dotenv.env['API_BASE_URL'] ?? 'http://localhost:3000/api';

  @lazySingleton
  PrettyDioLogger get prettyLogger {
    return PrettyDioLogger(requestHeader: true, requestBody: true);
  }

  @lazySingleton
  Dio dio(BaseOptions baseOptions, PrettyDioLogger logger) {
    final interceptors = <Interceptor>[if (kDebugMode) logger];
    return Dio(baseOptions)..interceptors.addAll(interceptors);
  }

  @lazySingleton
  BaseOptions dioBaseOptions(
    @Named('BaseUrl') String url,
  ) {
    return BaseOptions(
      baseUrl: url,
      connectTimeout: 30000
    );
  }
}
