import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_model.freezed.dart';
part 'app_user_model.g.dart';

//ignore_for_file: invalid_annotation_target
@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String mobileNumber,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
}
