import 'package:dio/dio.dart';

import 'authentication.dart';

const JSON_HEADER = "Content-Type:application/json";
const API_KEY = "0bf8c3b64b7c2bc8c78cf5546f113a5c91949d2592462719";

class DioConfig {
  static final DioConfig _instance = DioConfig.internal();

  factory DioConfig() => _instance;

  DioConfig.internal();

  Dio _dio;

  //final String _baseUrl = "https://sartori-ecommerce-demo.herokuapp.com/";
  final String _baseUrl = "http://192.168.0.194";

  get dio {
    BaseOptions options = new BaseOptions(
      baseUrl: _baseUrl,
    );
    if (_dio == null) {
      _dio = new Dio(options);
    }
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(CustomInterceptors());
    return _dio;
  }
}

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    final auth = await Authentication.authenticated();
    final token = await Authentication.getToken();
    if (auth) options.headers["Authorization"] = "Bearer $token";
    options.headers["Accept"] = "application/json";
    options.headers["X-Spree-Token"] = API_KEY;
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) async {
    print(err.toString());
    print(err.message);
    print(err.request.uri);
    // if (err.response.statusCode == 401) {
    //  final res = await AuthRepository().refresh();
    //print(res.data);
    //}
    return super.onError(err);
  }
}
