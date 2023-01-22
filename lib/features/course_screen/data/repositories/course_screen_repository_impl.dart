import 'package:dio/dio.dart';
import 'package:test_pancakeswap_app/features/course_screen/data/data_sources/course_screen_api.dart';
import 'package:test_pancakeswap_app/features/course_screen/domain/entities/course.dart';
import 'package:test_pancakeswap_app/features/course_screen/domain/repositories/course_screen_repository.dart';

class CourseScreenRepositoryImpl extends CourseScreenRepository {
  final courseApi = CourseScreenApi(Dio(BaseOptions(contentType: "application/json")));
  @override
  Future<Course> getCourse(String firstToken, String secondToken) {
    return courseApi.getCourse(firstToken, secondToken);
  }
  
}