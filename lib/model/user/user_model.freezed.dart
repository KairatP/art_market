// // coverage:ignore-file
// // GENERATED CODE - DO NOT MODIFY BY HAND
// // ignore_for_file: type=lint
// // ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

// part of 'user_model.dart';

// // **************************************************************************
// // FreezedGenerator
// // **************************************************************************

// T _$identity<T>(T value) => value;

// final _privateConstructorUsedError = UnsupportedError(
//     'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

// UserModel _$UserModelFromJson(Map<String, dynamic> json) {
//   return _UserModel.fromJson(json);
// }

// /// @nodoc
// mixin _$UserModel {
//   int get id => throw _privateConstructorUsedError;
//   String get login => throw _privateConstructorUsedError;
//   @JsonKey(name: 'created_at')
//   String get createdAt => throw _privateConstructorUsedError;
//   @JsonKey(name: 'updated_at')
//   String get updatedAt => throw _privateConstructorUsedError;
//   String get username => throw _privateConstructorUsedError;
//   String? get position => throw _privateConstructorUsedError;
//   String? get phone => throw _privateConstructorUsedError;
//   String? get email => throw _privateConstructorUsedError;

//   Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
//   @JsonKey(ignore: true)
//   $UserModelCopyWith<UserModel> get copyWith =>
//       throw _privateConstructorUsedError;
// }

// /// @nodoc
// abstract class $UserModelCopyWith<$Res> {
//   factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
//       _$UserModelCopyWithImpl<$Res, UserModel>;
//   @useResult
//   $Res call(
//       {int id,
//       String login,
//       @JsonKey(name: 'created_at') String createdAt,
//       @JsonKey(name: 'updated_at') String updatedAt,
//       String username,
//       String? position,
//       String? phone,
//       String? email});
// }

// /// @nodoc
// class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
//     implements $UserModelCopyWith<$Res> {
//   _$UserModelCopyWithImpl(this._value, this._then);

//   // ignore: unused_field
//   final $Val _value;
//   // ignore: unused_field
//   final $Res Function($Val) _then;

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? id = null,
//     Object? login = null,
//     Object? createdAt = null,
//     Object? updatedAt = null,
//     Object? username = null,
//     Object? position = freezed,
//     Object? phone = freezed,
//     Object? email = freezed,
//   }) {
//     return _then(_value.copyWith(
//       id: null == id
//           ? _value.id
//           : id // ignore: cast_nullable_to_non_nullable
//               as int,
//       login: null == login
//           ? _value.login
//           : login // ignore: cast_nullable_to_non_nullable
//               as String,
//       createdAt: null == createdAt
//           ? _value.createdAt
//           : createdAt // ignore: cast_nullable_to_non_nullable
//               as String,
//       updatedAt: null == updatedAt
//           ? _value.updatedAt
//           : updatedAt // ignore: cast_nullable_to_non_nullable
//               as String,
//       username: null == username
//           ? _value.username
//           : username // ignore: cast_nullable_to_non_nullable
//               as String,
//       position: freezed == position
//           ? _value.position
//           : position // ignore: cast_nullable_to_non_nullable
//               as String?,
//       phone: freezed == phone
//           ? _value.phone
//           : phone // ignore: cast_nullable_to_non_nullable
//               as String?,
//       email: freezed == email
//           ? _value.email
//           : email // ignore: cast_nullable_to_non_nullable
//               as String?,
//     ) as $Val);
//   }
// }

// /// @nodoc
// abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
//   factory _$$_UserModelCopyWith(
//           _$_UserModel value, $Res Function(_$_UserModel) then) =
//       __$$_UserModelCopyWithImpl<$Res>;
//   @override
//   @useResult
//   $Res call(
//       {int id,
//       String login,
//       @JsonKey(name: 'created_at') String createdAt,
//       @JsonKey(name: 'updated_at') String updatedAt,
//       String username,
//       String? position,
//       String? phone,
//       String? email});
// }

// /// @nodoc
// class __$$_UserModelCopyWithImpl<$Res>
//     extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
//     implements _$$_UserModelCopyWith<$Res> {
//   __$$_UserModelCopyWithImpl(
//       _$_UserModel _value, $Res Function(_$_UserModel) _then)
//       : super(_value, _then);

//   @pragma('vm:prefer-inline')
//   @override
//   $Res call({
//     Object? id = null,
//     Object? login = null,
//     Object? createdAt = null,
//     Object? updatedAt = null,
//     Object? username = null,
//     Object? position = freezed,
//     Object? phone = freezed,
//     Object? email = freezed,
//   }) {
//     return _then(_$_UserModel(
//       id: null == id
//           ? _value.id
//           : id // ignore: cast_nullable_to_non_nullable
//               as int,
//       login: null == login
//           ? _value.login
//           : login // ignore: cast_nullable_to_non_nullable
//               as String,
//       createdAt: null == createdAt
//           ? _value.createdAt
//           : createdAt // ignore: cast_nullable_to_non_nullable
//               as String,
//       updatedAt: null == updatedAt
//           ? _value.updatedAt
//           : updatedAt // ignore: cast_nullable_to_non_nullable
//               as String,
//       username: null == username
//           ? _value.username
//           : username // ignore: cast_nullable_to_non_nullable
//               as String,
//       position: freezed == position
//           ? _value.position
//           : position // ignore: cast_nullable_to_non_nullable
//               as String?,
//       phone: freezed == phone
//           ? _value.phone
//           : phone // ignore: cast_nullable_to_non_nullable
//               as String?,
//       email: freezed == email
//           ? _value.email
//           : email // ignore: cast_nullable_to_non_nullable
//               as String?,
//     ));
//   }
// }

// /// @nodoc
// @JsonSerializable()
// class _$_UserModel implements _UserModel {
//   _$_UserModel(
//       {required this.id,
//       required this.login,
//       @JsonKey(name: 'created_at') required this.createdAt,
//       @JsonKey(name: 'updated_at') required this.updatedAt,
//       required this.username,
//       this.position,
//       this.phone,
//       this.email});

//   factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
//       _$$_UserModelFromJson(json);

//   @override
//   final int id;
//   @override
//   final String login;
//   @override
//   @JsonKey(name: 'created_at')
//   final String createdAt;
//   @override
//   @JsonKey(name: 'updated_at')
//   final String updatedAt;
//   @override
//   final String username;
//   @override
//   final String? position;
//   @override
//   final String? phone;
//   @override
//   final String? email;

//   @override
//   String toString() {
//     return 'UserModel(id: $id, login: $login, createdAt: $createdAt, updatedAt: $updatedAt, username: $username, position: $position, phone: $phone, email: $email)';
//   }

//   @override
//   bool operator ==(dynamic other) {
//     return identical(this, other) ||
//         (other.runtimeType == runtimeType &&
//             other is _$_UserModel &&
//             (identical(other.id, id) || other.id == id) &&
//             (identical(other.login, login) || other.login == login) &&
//             (identical(other.createdAt, createdAt) ||
//                 other.createdAt == createdAt) &&
//             (identical(other.updatedAt, updatedAt) ||
//                 other.updatedAt == updatedAt) &&
//             (identical(other.username, username) ||
//                 other.username == username) &&
//             (identical(other.position, position) ||
//                 other.position == position) &&
//             (identical(other.phone, phone) || other.phone == phone) &&
//             (identical(other.email, email) || other.email == email));
//   }

//   @JsonKey(ignore: true)
//   @override
//   int get hashCode => Object.hash(runtimeType, id, login, createdAt, updatedAt,
//       username, position, phone, email);

//   @JsonKey(ignore: true)
//   @override
//   @pragma('vm:prefer-inline')
//   _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
//       __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

//   @override
//   Map<String, dynamic> toJson() {
//     return _$$_UserModelToJson(
//       this,
//     );
//   }
// }

// abstract class _UserModel implements UserModel {
//   factory _UserModel(
//       {required final int id,
//       required final String login,
//       @JsonKey(name: 'created_at') required final String createdAt,
//       @JsonKey(name: 'updated_at') required final String updatedAt,
//       required final String username,
//       final String? position,
//       final String? phone,
//       final String? email}) = _$_UserModel;

//   factory _UserModel.fromJson(Map<String, dynamic> json) =
//       _$_UserModel.fromJson;

//   @override
//   int get id;
//   @override
//   String get login;
//   @override
//   @JsonKey(name: 'created_at')
//   String get createdAt;
//   @override
//   @JsonKey(name: 'updated_at')
//   String get updatedAt;
//   @override
//   String get username;
//   @override
//   String? get position;
//   @override
//   String? get phone;
//   @override
//   String? get email;
//   @override
//   @JsonKey(ignore: true)
//   _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
//       throw _privateConstructorUsedError;
// }
