import 'package:dio/dio.dart';

import 'authentication.dart';

const JSON_HEADER = "Content-Type:application/json";
const API_KEY = "eb22fcdefadcb06c1dca082f73a96bc20f2463f8bb68ef26";

class DioConfig {
  static final DioConfig _instance = DioConfig.internal();

  factory DioConfig() => _instance;

  DioConfig.internal();

  Dio _dio;

  //final String _baseUrl = "https://sartori-ecommerce-demo.herokuapp.com/";
  final String _baseUrl = "http://192.168.0.193";

  get dio {
    BaseOptions options = new BaseOptions(
      baseUrl: _baseUrl,
    );
    if (_dio == null) {
      _dio = new Dio(options);
    }
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000;
    _dio.interceptors.add(CustomInterceptors());
    return _dio;
  }
}

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    final auth = await Authentication.authenticated();
    final token = await Authentication.getToken();
    if (auth) options.headers["Authorization"] = token;
    options.headers["Accept"] = "application/json";
    options.headers["X-Spree-Token"] = API_KEY;
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) {
    print(err.toString());
    print(err.message);
    if (err.response.statusCode == 401) {
      Authentication.logout();
    }
    return super.onError(err);
  }
}
