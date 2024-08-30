import 'package:dio/dio.dart';
import 'package:flutter_classroom/repository/api/interceptors/authorization_interceptor.dart';
import 'package:flutter_classroom/repository/urlpool.dart';

import 'api/dio_client.dart';

//#########

const String _baseUrl = "https://nibrahim.pythonanywhere.com/";

//#########
String apiKey = 'af006';

class APIRepository {
  late DioClient dioClient;
  late URLPool url;
  APIRepository() {
    var dio = Dio();
    dioClient = DioClient(
      _baseUrl,
      dio,
      interceptors: [
        AuthorizationInterceptor(),
      ],
    );
    url = URLPool();
  }
}
