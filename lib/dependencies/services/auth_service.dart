import 'dart:async';

import 'package:art_market/dependencies/Art_dio.dart';
import 'package:art_market/model/token/token_model.dart';
import 'package:art_market/model/user/change_password_user_model.dart';
import 'package:art_market/model/user/create_user_model.dart';
import 'package:art_market/model/user/forget_password_user_model.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

abstract class AuthService {
  Future<TokenModel> login(String username, String password);
  Future<CreateUserModel> create(
      String email, String password, String confirmPassword);
  Future<ForgetPasswordUserModel> forgetPassword(String email);
  Future<ChangePasswordUserModel> changePassword(
      String email, String password, String confirmPassword);
  Future<TokenModel> verifyCode(String email, int code);
}

class AuthServiceImplement extends AuthService {
  AuthServiceImplement({required ArtDio authDio}) {
    // authDio.path = 'account/';
    dio = authDio.dio;
  }
  late final Dio dio;

  final Box tokensBox = Hive.box('tokens');
  final Box userBox = Hive.box('user');

  @override
  Future<TokenModel> login(String username, String password) async {
    try {
      Response response = await dio.post(
        'account/login',
        data: {'username': username, 'password': password},
      );
      TokenModel tokensModel = TokenModel(token: response.data['token']);

      // TokenModel tokensModel = TokenModel.fromJson(response.data);
      // UserModel userModel = UserModel.fromJson(response.data['user']);
      tokensBox.put('access', tokensModel.token);
      // userBox.put('id', userModel.id);
      // userBox.put('login', userModel.login);
      // userBox.put('created_at', userModel.createdAt);
      // userBox.put('updated_at', userModel.updatedAt);
      // userBox.put('username', userModel.username);
      // userBox.put('position', userModel.position);
      // userBox.put('phone', userModel.phone);
      // userBox.put('email', userModel.email);
      return tokensModel;

      // return response.data;
    } catch (e) {
      rethrow;
    }

    // const api = 'http://194.4.56.181/api/v1/account/login';
    // final data = {'username': username, 'password': password};
    // Response response;
    // response = await dio.post(api, data: data);

    // // if (response.statusCode == 200) {
    //   try {
    //     TokenModel tokensModel =
    //         TokenModel(username: username, token: response.data['token']);

    //     print(tokensModel.token);
    //     return tokensModel;
    //   } catch (e) {
    //     rethrow;
    //   }
  }


  @override
  Future<CreateUserModel> create(
    String email, String password, String confirmPassword) async {
  try {
    Response response = await dio.post(
      'account/create',
      data: {
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
      },
    );

    // Check if the response has an error
    if (response.data['errors'] != null) {
      // Handle error here, you can throw a custom exception if needed
      throw Exception('Error in user creation: ${response.data['errors']}');
    }

    CreateUserModel createModel = CreateUserModel(
      message: response.data['message'],
      errors: response.data['errors'],
      succeeded: response.data['succeeded'],
      data: response.data['data'],
    );
    return createModel;
  } catch (e) {
    // Handle DioError or other specific errors
    rethrow;
  }
}

  // @override
  // Future<CreateUserModel> create(
  //     String email, String password, String confirmPassword) async {

  //   try {
  //     Response response = await dio.post(
  //       'account/create',
  //       data: {
  //         'email': email,
  //         'password': password,
  //         'confirmPassword': confirmPassword,
  //       },
  //     );
  //     CreateUserModel createModel = CreateUserModel(
  //         message: response.data['message'],
  //         errors: response.data['errors'],
  //         succeeded: response.data['succeeded'],
  //         data: response.data['data']
  //       );
  //     return createModel;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
Future<ForgetPasswordUserModel> forgetPassword(String email) async {
  try {
    Response response = await dio.post(
      'account/forgotPassword',
      data: {
        'email': email,
      },
    );

    // Check if the response has an error (status code 400)
    if (response.statusCode == 400) {
      throw (
        request: response.requestOptions,
        response: response,
        type: response,
        error: 'Bad Request: ${response.data['message']}',
      );
    }

    ForgetPasswordUserModel forgotModel = ForgetPasswordUserModel(
      message: response.data['message'],
      errors: response.data['errors'],
      succeeded: response.data['succeeded'],
      data: response.data['data'],
    );
    return forgotModel;
  } on () {

    rethrow; 
  } catch (e) {
    rethrow;
  }
}


  // @override
  // Future<ForgetPasswordUserModel> forgetPassword(String email) async {
  //   try {
  //     Response response = await dio.post(
  //       'account/forgotPassword',
  //       data: {
  //         'email': email,
  //       },
  //     );
  //     ForgetPasswordUserModel forgotModel = ForgetPasswordUserModel(
  //       message: response.data['message'],
  //       errors: response.data['errors'],
  //       succeeded: response.data['succeeded'],
  //       data: response.data['data']
  //     );
  //     return forgotModel;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  Future<ChangePasswordUserModel> changePassword(
      String email, String password, String confirmPassword) async {
    try {
      Response response = await dio.post(
        'account/changePassword',
        data: {
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
        },
      );
      ChangePasswordUserModel changeModel = ChangePasswordUserModel(
        message: response.data['message'],
        errors: response.data['errors'],
        succeeded: response.data['succeeded'],
        data: response.data['data']
      );
      return changeModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TokenModel> verifyCode(String email, int code) async {
    try {
      Response response = await dio.post(
        'account/verifyCode',
        data: {
          'email': email,
          'code': code,
        },
      );
      return response.data;

      // tokensModel;
    } catch (e) {
      rethrow;
    }
  }
}
