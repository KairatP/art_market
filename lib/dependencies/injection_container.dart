import 'package:art_market/dependencies/Art_dio.dart';
import 'package:art_market/dependencies/services/auth_service.dart';
import 'package:art_market/dependencies/services/delivery_service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

initGetIt() {
  getIt.registerLazySingleton<ArtDio>(
    () => ArtDio(),
  );
  getIt.registerLazySingleton<AuthService>(
    () => AuthServiceImplement(authDio: getIt()),
  );
  // getIt.registerLazySingleton<WarehouseService>(
  //   () => WarehouseServiceImplement(brDio: getIt()),
  // );


  getIt.registerLazySingleton<ArtDeliveryService>(
    () => ArtListServiceImplement(artDio: getIt()),
  //   getIt.registerLazySingleton<ArtDeliveryService>(
  //   () => ArtDeliveryService(artDio: getIt()),
  
  );
  // getIt.registerLazySingleton<AuthCubitOut>(
  //   () => AuthCubitOut(),
  // );
}