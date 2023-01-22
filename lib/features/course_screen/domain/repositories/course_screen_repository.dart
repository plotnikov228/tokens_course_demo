import 'package:test_pancakeswap_app/features/course_screen/domain/entities/course.dart';

abstract class CourseScreenRepository {
  Future<Course> getCourse(String firstToken, String secondToken);
}