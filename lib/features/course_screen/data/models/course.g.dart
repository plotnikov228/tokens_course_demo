// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../domain/entities/course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json, String tokenName) {
  return Course(
    course: (json[tokenName] as num).toDouble(),
  );
}

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'tokenName': instance.tokenName,
      'course': instance.course,
    };
