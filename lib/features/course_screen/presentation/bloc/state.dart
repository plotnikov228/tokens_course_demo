import 'package:test_pancakeswap_app/features/course_screen/domain/entities/course.dart';

abstract class CourseScreenState {}

class LoadingCourseScreenState extends CourseScreenState {}
class InitialCourseScreenState extends CourseScreenState {
  final Course course;

  InitialCourseScreenState(this.course);
}