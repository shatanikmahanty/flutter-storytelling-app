// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cron_job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CronJob _$CronJobFromJson(Map<String, dynamic> json) {
  return _CronJob.fromJson(json);
}

/// @nodoc
mixin _$CronJob {
  bool get enabled => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  bool? get saveResponses => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  Map<String, dynamic> get schedule => throw _privateConstructorUsedError;

  /// 0 for GET, 1 for POST, 2 for OPTIONS, 3 for HEAD, 4 for PUT, 5 for DELETE, 6 for TRACE, 7 for CONNECT, 8 for PATCH
  int get requestMethod => throw _privateConstructorUsedError;
  int? get type => throw _privateConstructorUsedError;

  /// The JobExtendedData holds extended request data for a job.
  /// _______________________________________________________________
  /// | Key        Type       Description                           |
  /// | headers    Map        Request headers (key-value dictionary)|
  /// |  body      String     Request body                          |
  /// _______________________________________________________________
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get extendedData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CronJobCopyWith<CronJob> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CronJobCopyWith<$Res> {
  factory $CronJobCopyWith(CronJob value, $Res Function(CronJob) then) =
      _$CronJobCopyWithImpl<$Res, CronJob>;
  @useResult
  $Res call(
      {bool enabled,
      String? title,
      bool? saveResponses,
      String url,
      Map<String, dynamic> schedule,
      int requestMethod,
      int? type,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? extendedData});
}

/// @nodoc
class _$CronJobCopyWithImpl<$Res, $Val extends CronJob>
    implements $CronJobCopyWith<$Res> {
  _$CronJobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? title = freezed,
    Object? saveResponses = freezed,
    Object? url = null,
    Object? schedule = null,
    Object? requestMethod = null,
    Object? type = freezed,
    Object? extendedData = freezed,
  }) {
    return _then(_value.copyWith(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      saveResponses: freezed == saveResponses
          ? _value.saveResponses
          : saveResponses // ignore: cast_nullable_to_non_nullable
              as bool?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      requestMethod: null == requestMethod
          ? _value.requestMethod
          : requestMethod // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      extendedData: freezed == extendedData
          ? _value.extendedData
          : extendedData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CronJobImplCopyWith<$Res> implements $CronJobCopyWith<$Res> {
  factory _$$CronJobImplCopyWith(
          _$CronJobImpl value, $Res Function(_$CronJobImpl) then) =
      __$$CronJobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool enabled,
      String? title,
      bool? saveResponses,
      String url,
      Map<String, dynamic> schedule,
      int requestMethod,
      int? type,
      @JsonKey(includeIfNull: false) Map<String, dynamic>? extendedData});
}

/// @nodoc
class __$$CronJobImplCopyWithImpl<$Res>
    extends _$CronJobCopyWithImpl<$Res, _$CronJobImpl>
    implements _$$CronJobImplCopyWith<$Res> {
  __$$CronJobImplCopyWithImpl(
      _$CronJobImpl _value, $Res Function(_$CronJobImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? title = freezed,
    Object? saveResponses = freezed,
    Object? url = null,
    Object? schedule = null,
    Object? requestMethod = null,
    Object? type = freezed,
    Object? extendedData = freezed,
  }) {
    return _then(_$CronJobImpl(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      saveResponses: freezed == saveResponses
          ? _value.saveResponses
          : saveResponses // ignore: cast_nullable_to_non_nullable
              as bool?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      schedule: null == schedule
          ? _value._schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      requestMethod: null == requestMethod
          ? _value.requestMethod
          : requestMethod // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      extendedData: freezed == extendedData
          ? _value._extendedData
          : extendedData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CronJobImpl implements _CronJob {
  const _$CronJobImpl(
      {this.enabled = true,
      this.title = 'Cron Job',
      this.saveResponses = false,
      required this.url,
      required final Map<String, dynamic> schedule,
      required this.requestMethod,
      this.type = 0,
      @JsonKey(includeIfNull: false) final Map<String, dynamic>? extendedData})
      : _schedule = schedule,
        _extendedData = extendedData;

  factory _$CronJobImpl.fromJson(Map<String, dynamic> json) =>
      _$$CronJobImplFromJson(json);

  @override
  @JsonKey()
  final bool enabled;
  @override
  @JsonKey()
  final String? title;
  @override
  @JsonKey()
  final bool? saveResponses;
  @override
  final String url;
  final Map<String, dynamic> _schedule;
  @override
  Map<String, dynamic> get schedule {
    if (_schedule is EqualUnmodifiableMapView) return _schedule;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_schedule);
  }

  /// 0 for GET, 1 for POST, 2 for OPTIONS, 3 for HEAD, 4 for PUT, 5 for DELETE, 6 for TRACE, 7 for CONNECT, 8 for PATCH
  @override
  final int requestMethod;
  @override
  @JsonKey()
  final int? type;

  /// The JobExtendedData holds extended request data for a job.
  /// _______________________________________________________________
  /// | Key        Type       Description                           |
  /// | headers    Map        Request headers (key-value dictionary)|
  /// |  body      String     Request body                          |
  /// _______________________________________________________________
  final Map<String, dynamic>? _extendedData;

  /// The JobExtendedData holds extended request data for a job.
  /// _______________________________________________________________
  /// | Key        Type       Description                           |
  /// | headers    Map        Request headers (key-value dictionary)|
  /// |  body      String     Request body                          |
  /// _______________________________________________________________
  @override
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get extendedData {
    final value = _extendedData;
    if (value == null) return null;
    if (_extendedData is EqualUnmodifiableMapView) return _extendedData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'CronJob(enabled: $enabled, title: $title, saveResponses: $saveResponses, url: $url, schedule: $schedule, requestMethod: $requestMethod, type: $type, extendedData: $extendedData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CronJobImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.saveResponses, saveResponses) ||
                other.saveResponses == saveResponses) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._schedule, _schedule) &&
            (identical(other.requestMethod, requestMethod) ||
                other.requestMethod == requestMethod) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._extendedData, _extendedData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      enabled,
      title,
      saveResponses,
      url,
      const DeepCollectionEquality().hash(_schedule),
      requestMethod,
      type,
      const DeepCollectionEquality().hash(_extendedData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CronJobImplCopyWith<_$CronJobImpl> get copyWith =>
      __$$CronJobImplCopyWithImpl<_$CronJobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CronJobImplToJson(
      this,
    );
  }
}

abstract class _CronJob implements CronJob {
  const factory _CronJob(
      {final bool enabled,
      final String? title,
      final bool? saveResponses,
      required final String url,
      required final Map<String, dynamic> schedule,
      required final int requestMethod,
      final int? type,
      @JsonKey(includeIfNull: false)
      final Map<String, dynamic>? extendedData}) = _$CronJobImpl;

  factory _CronJob.fromJson(Map<String, dynamic> json) = _$CronJobImpl.fromJson;

  @override
  bool get enabled;
  @override
  String? get title;
  @override
  bool? get saveResponses;
  @override
  String get url;
  @override
  Map<String, dynamic> get schedule;
  @override

  /// 0 for GET, 1 for POST, 2 for OPTIONS, 3 for HEAD, 4 for PUT, 5 for DELETE, 6 for TRACE, 7 for CONNECT, 8 for PATCH
  int get requestMethod;
  @override
  int? get type;
  @override

  /// The JobExtendedData holds extended request data for a job.
  /// _______________________________________________________________
  /// | Key        Type       Description                           |
  /// | headers    Map        Request headers (key-value dictionary)|
  /// |  body      String     Request body                          |
  /// _______________________________________________________________
  @JsonKey(includeIfNull: false)
  Map<String, dynamic>? get extendedData;
  @override
  @JsonKey(ignore: true)
  _$$CronJobImplCopyWith<_$CronJobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
