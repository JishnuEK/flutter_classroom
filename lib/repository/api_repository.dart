import 'package:dio/dio.dart';
import 'package:flutter_classroom/repository/api/interceptors/authorization_interceptor.dart';
import 'package:flutter_classroom/repository/urlpool.dart';

import 'api/dio_client.dart';

//#########

const String _baseUrl = "https://dkworld.leadmlm.in/api/";

// LIVE
// const String _baseUrl = 'https://dkworld.in/api/';

const String apiKey =
    "jjOOboYoc8Ymc4W4vigKtys2S6hdMs4bcoLyzPdq3fIrkWo2j6wKMqBq7mzhFr5Ji4nZG9CYjGSNyTj8pcNSQI2BqagNxGTgI4eVWVccOTyP723kKviA6uYrCIJlPd89De1hAxYGO1ybp6vefuYgzeNarQPNorsAGI1qdm8DJxCPPPgCwueYiZm6DiUJfTIxQhKehL1SnXAxA8k5ljr2OfcgcZsfCrf9JYju73AwLVQ5xJ1YfmtOOca4FUKWzp07";

//#########

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
