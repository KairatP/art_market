import 'package:art_market/dependencies/environment_config.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';


// class ArtDio {
//   Dio dio = Dio(BaseOptions(baseUrl: EnvironmentConfig.apiUrl));

//   Dio get instance => dio;

//   set path(String path) => dio = Dio(
//         BaseOptions(baseUrl: EnvironmentConfig.apiUrl + path),
//       )..interceptors.addAll([
//           ArtDioInterceptor(),
//         ]);

//   ArtDio() {
//     dio.interceptors.addAll([
//       ArtDioInterceptor(),
//     ]);
//   }
// }

// class ArtDioInterceptor extends Interceptor {
//   Dio dio = Dio(BaseOptions(baseUrl: EnvironmentConfig.apiUrl));
//   Box tokensBox = Hive.box('tokens');

//   @override
//   onRequest(options, handler) {
//     options.headers['Authorization'] = 'Bearer ${tokensBox.get('access')}';

//     super.onRequest(options, handler);
//   }
// }



class ArtDio {
  Dio dio = Dio(BaseOptions(baseUrl: EnvironmentConfig.apiUrl));

  Dio get instance => dio;

  set path(String path) => dio.options.baseUrl = EnvironmentConfig.apiUrl + path;

  ArtDio() {
    dio.interceptors.addAll([
      ArtDioInterceptor(),
    ]);
  }
}

class ArtDioInterceptor extends Interceptor {
  Box tokensBox = Hive.box('tokens');



  @override
  onRequest(options, handler) {
    options.headers['Authorization'] = 'Bearer ${tokensBox.get('access')}';
    return super.onRequest(options, handler);
  }
}

  