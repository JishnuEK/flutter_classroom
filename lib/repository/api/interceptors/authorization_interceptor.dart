import 'package:dio/dio.dart';

import '../../api_repository.dart';

const String TEsttoken =
    '8l47y9LvwdgbQR1TgywS9M7KGuBGjXl0Qx1zybtD9fq6ILFuFLZNxLcJGvsz';

class AuthorizationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers = getCustomheader();
    options.queryParameters = getApiKey();
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

  Map<String, String> getApiKey() {
    final parameters = {'api_key': apiKey};
    return parameters;
  }

  Map<String, String> getCustomheader() {
    final header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return header;
  }
}
