// ignore_for_file: unused_local_variable

import 'package:art_market/dependencies/Art_dio.dart';
import 'package:art_market/screens/art_page/model/art_model.dart';
import 'package:dio/dio.dart';

abstract class ArtDeliveryService {
  Future<List<ArtModel>> getArtList(String queryParameters);
}

class ArtListServiceImplement implements ArtDeliveryService {
  ArtListServiceImplement({required ArtDio artDio}) {
    artDio.path = 'delivery/';
    dio = artDio.dio;
  }
  late final Dio dio;

  @override
  Future<List<ArtModel>> getArtList(String queryParameters) async {
    try {
      Response res = await dio.get('orders', queryParameters: {
        'q': queryParameters,
      });
      return (res.data as List).map((json) => ArtModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<void> postOrder(OrderPostModel postModel) async {
  //   try {
  //     Response res = await dio.post(
  //       'requests',
  //       data: postModel.toJson(),
  //     );
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
