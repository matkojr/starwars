import 'package:dio/dio.dart';

class HTTPInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(err);
    return super.onError(err, handler);
  }
}

class HTTP {
  late Dio client;
  HTTP() {
    client = Dio(BaseOptions(
      baseUrl: 'https://swapi.dev/api/',
      receiveDataWhenStatusError: true,
      contentType: 'application/json',
      validateStatus: (status) => status! < 400,
    ));
    client.interceptors.add(
      HTTPInterceptor(),
    );
  }

  Future<dynamic> getPeople() async {
    Response response = await client.get('people');

    return response.data;
  }

  Future<dynamic> getDetails(String url)async {{
    Response response = await client.get(url);
    return response.data;
  }}
}

final http = HTTP();
