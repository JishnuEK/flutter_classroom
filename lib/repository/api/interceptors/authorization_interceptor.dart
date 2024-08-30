import 'package:dio/dio.dart';

import '../../api_repository.dart';

const String TEsttoken =
    '8l47y9LvwdgbQR1TgywS9M7KGuBGjXl0Qx1zybtD9fq6ILFuFLZNxLcJGvsz';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) {
    print(err);

    super.onError(err, handler);
  }
}
