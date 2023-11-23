// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:art_market/dependencies/Art_dio.dart';
import 'package:art_market/model/art/my_art_model.dart';
import 'package:art_market/model/user/user_model_g.dart';
import 'package:art_market/model/user/user_profile_model.dart';
import 'package:art_market/model/art/art_model.dart';
import 'package:dio/dio.dart';

abstract class ArtDeliveryService {
  Future<UserProfileModel> getMyProfile();

  Future<MyProfileUserModel> updateMyProfile(
      File ava, String name, String phoneNumber, String country, String city);
  Future updateMyPost(
    String id,
    int price,
    String description,
    int width,
    int height,
    String colorType,
    String panoType,
    List<File> pictures,
  );
  Future<ArtModel> getArtList(int pageNumber, int pageSize, String search, List<String> filter);
  Future<MyArtModel> getMyArtList(int pageNumber, int pageSize);
  Future postMyArt(
    int price,
    String description,
    int width,
    int height,
    String colorType,
    String panoType,
    List<File> picture,
    // String country,
    // String city,
  );
  Future deletePost(String postId);
}

class ArtListServiceImplement implements ArtDeliveryService {
  ArtListServiceImplement({required ArtDio artDio}) {
    artDio.path = '/';
    dio = artDio.dio;
  }
  late final Dio dio;

  @override
  Future<UserProfileModel> getMyProfile() async {
    try {
      Response res = await dio.get('account/getProfile');

      return UserProfileModel.fromJson(res.data);
      // return (res.data).map((json) => UserProfileModel.fromJson(json));
    } catch (e) {
      rethrow;
    }
  }

  @override
Future<MyProfileUserModel> updateMyProfile(File ava, String name, String phoneNumber, String country, String city) async {
  final FormData sendData;

  if (ava.path.isNotEmpty) {
    sendData = FormData.fromMap({
      "name": name,
      "phoneNumber": phoneNumber,
      "country": country,
      "city": city,
      "avatar": await MultipartFile.fromFile(ava.path, filename: ava.path.split("/").last),
    });
  } else {
    sendData = FormData.fromMap({
      "name": name,
      "phoneNumber": phoneNumber,
      "country": country,
      "city": city,
      "avatar": null,
    });
  }

  try {
    Response response = await dio.post('account/updateProfile', data: sendData);

    // Assuming response.data is a Map<String, dynamic>
    return MyProfileUserModel.fromJson(response.data);
  } catch (e) {
    rethrow;
  }
}

  @override
  Future<ArtModel> getArtList(
      int pageNumber, int pageSize, String search, List<String> filter) async {
    try {
      Response response = await dio.post(
        'post/list',
        data: {
          "pageNumber": pageNumber,
          "pageSize": pageSize,
          "searchText": search,
          "countries": filter,
        },
      );
      
      ArtModel asd = ArtModel.fromJson(response.data);
      return ArtModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MyArtModel> getMyArtList(int pageNumber, int pageSize) async {
    try {
      Response response = await dio.post(
        'post/myPosts/list',
        data: {
          "pageNumber": pageNumber,
          "pageSize": pageSize,
        },
      );
      MyArtModel asd = MyArtModel.fromJson(response.data);
      return MyArtModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future postMyArt(
    int price,
    String description,
    int width,
    int height,
    String colorType,
    String panoType,
    List<File> pictures,
    // String country,
    // String city,
  ) async {
    var sendData = FormData.fromMap({
      'price': price,
      'description': description,
      'width': width,
      'height': height,
      'color': colorType,
      'pano': panoType,
    });
    for (int i = 0; i < pictures.length; i++) {
      sendData.files.addAll([
        MapEntry(
            'pictures',
            await MultipartFile.fromFile(pictures[i].path,
                filename: pictures[i].path.split("/").last))
      ]);
    }

    try {
      Response response = await dio.post('post/create', data: sendData);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future updateMyPost(
    String id,
    int price,
    String description,
    int width,
    int height,
    String colorType,
    String panoType,
    List<File> pictures,
  ) async {
    FormData sendData;
    if (pictures.isNotEmpty) {
      sendData = FormData.fromMap({
        'id': id,
        'price': price,
        'description': description,
        'width': width,
        'height': height,
        'color': colorType,
        'pano': panoType,
      });
      for (int i = 0; i < pictures.length; i++) {
        sendData.files.addAll([
          MapEntry(
              'pictures',
              await MultipartFile.fromFile(pictures[i].path,
                  filename: pictures[i].path.split("/").last))
        ]);
      }
    } else {
      sendData = FormData.fromMap({
        'id': id,
        'price': price,
        'description': description,
        'width': width,
        'height': height,
        'color': colorType,
        'pano': panoType,
        'pictures': null,
      });
    }

    try {
      Response response = await dio.post('post/update', data: sendData);
      // MyArtModel asd = MyArtModel.fromJson(response.data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deletePost(String deletePost) async {
    // try {
    //   Response response = await dio.delete(
    //     'post/delete',
    //     data: {
    //       "id": deletePost,
    //     },
    //   );
    //   return response.data;
    // } catch (e) {
    //   rethrow;
    // }

    try {
      Response response = await dio.post('post/delete', data: {
        "id": deletePost,
      });
      // Check for success status code (2xx)
      if (response.statusCode == 200) {
        return response.data;
      } else {
        // Handle unexpected status codes
        return null; // or throw an exception
      }
    } catch (e) {
      // Handle Dio errors
      rethrow; // Re-throw the error after handling it
    }
  }
}
