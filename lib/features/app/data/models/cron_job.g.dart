// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cron_job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CronJobImpl _$$CronJobImplFromJson(Map<String, dynamic> json) =>
    _$CronJobImpl(
      enabled: json['enabled'] as bool? ?? true,
      title: json['title'] as String? ?? 'Cron Job',
      saveResponses: json['saveResponses'] as bool? ?? false,
      url: json['url'] as String,
      schedule: json['schedule'] as Map<String, dynamic>,
      requestMethod: json['requestMethod'] as int,
      type: json['type'] as int? ?? 0,
      extendedData: json['extendedData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$CronJobImplToJson(_$CronJobImpl instance) {
  final val = <String, dynamic>{
    'enabled': instance.enabled,
    'title': instance.title,
    'saveResponses': instance.saveResponses,
    'url': instance.url,
    'schedule': instance.schedule,
    'requestMethod': instance.requestMethod,
    'type': instance.type,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('extendedData', instance.extendedData);
  return val;
}
