import 'package:json_annotation/json_annotation.dart';

part '../../data/models/course.g.dart';

@JsonSerializable()
class Course {
  late DateTime time;
  final String? tokenName;
  final double course;

  Course({required this.course , this.tokenName});

  factory Course.fromJson(Map<String, dynamic> json, String tokenName) => _$CourseFromJson(json, tokenName);
}