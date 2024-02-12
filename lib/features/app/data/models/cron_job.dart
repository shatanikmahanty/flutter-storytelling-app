import 'package:freezed_annotation/freezed_annotation.dart';

part 'cron_job.freezed.dart';
part 'cron_job.g.dart';

//ignore_for_file: invalid_annotation_target
@freezed
class CronJob with _$CronJob {
  /// [CronJob] is a model class for the cron job data
  const factory CronJob({
    @Default(true) bool enabled,
    @Default('Cron Job') String? title,
    @Default(false) bool? saveResponses,
    required String url,
    required Map<String, dynamic> schedule,

    /// 0 for GET, 1 for POST, 2 for OPTIONS, 3 for HEAD, 4 for PUT, 5 for DELETE, 6 for TRACE, 7 for CONNECT, 8 for PATCH
    required int requestMethod,
    @Default(0) int? type,

    /// The JobExtendedData holds extended request data for a job.
    /// _______________________________________________________________
    /// | Key        Type       Description                           |
    /// | headers    Map        Request headers (key-value dictionary)|
    /// |  body      String     Request body                          |
    /// _______________________________________________________________
    @JsonKey(includeIfNull: false) Map<String, dynamic>? extendedData,
  }) = _CronJob;

  factory CronJob.fromJson(Map<String, dynamic> json) => _$CronJobFromJson(json);
}
