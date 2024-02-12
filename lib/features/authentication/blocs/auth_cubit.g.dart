// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStateImpl _$$AuthStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthStateImpl(
      user: json['user'] == null
          ? null
          : AppUser.fromJson(json['user'] as Map<String, dynamic>),
      phoneNumber: json['phoneNumber'] as String?,
      resendToken: json['resendToken'] as int?,
      isNewUser: json['isNewUser'] as bool? ?? false,
      isOtpRequested: json['isOtpRequested'] as bool? ?? false,
    );

Map<String, dynamic> _$$AuthStateImplToJson(_$AuthStateImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'phoneNumber': instance.phoneNumber,
      'resendToken': instance.resendToken,
      'isNewUser': instance.isNewUser,
      'isOtpRequested': instance.isOtpRequested,
    };
