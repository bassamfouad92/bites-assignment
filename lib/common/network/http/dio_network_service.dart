import 'package:bites_assignment/common/model/secure_user_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../configs/app_configs.dart';
import 'network_service.dart';

class DioNetworkService extends NetworkService {
  static final Dio dio = Dio();
  final userSession = SecureUserSession();

  DioNetworkService() {
    dio.options = dioBaseOptions;
    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    userSession.getToken().then((token) {
      if (token is String) {
        updateHeader({'Authorization': token});
      }
    });
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
      );
  @override
  String get baseUrl => AppConfigs.baseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    dio.options.headers = header;
    return header;
  }

  @override
  Future<dynamic> post(String endpoint, {Map<String, dynamic>? data}) {
    final res = dio.post(baseUrl + endpoint, data: data);
    return res;
  }

  @override
  Future<dynamic> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = dio.get(baseUrl + endpoint, queryParameters: queryParameters);
    return res;
  }
}
