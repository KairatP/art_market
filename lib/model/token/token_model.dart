// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'token_model.freezed.dart';
// part 'token_model.g.dart';


class TokenModel {
  final String token;

  TokenModel({required this.token});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}





// class TokenModel {
//   final String token;

//   TokenModel({required this.token});
// }

// @freezed
// class TokenModel with _$TokenModel {

//   factory TokenModel({
//     // ignore: invalid_annotation_target
//     required String token,
//     // // ignore: invalid_annotation_target
//     // @JsonKey(name:'token_type') required String tokenType,
//     // // ignore: invalid_annotation_target
//     // @JsonKey(name:'expires_in') required int expiresIn,
// // required UserModel user,
//   }) = _TokenModel;

//   factory TokenModel.fromJson(Map<String, dynamic> json) => _$TokenModelFromJson(json);
// }

