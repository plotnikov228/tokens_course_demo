import 'package:test_pancakeswap_app/features/course_screen/domain/entities/course.dart';
import 'package:test_pancakeswap_app/features/course_screen/domain/repositories/course_screen_repository.dart';

class GetCourse {
  final CourseScreenRepository repository;

  GetCourse(this.repository);

  Future<Course> getCourse(String firstToken, String secondToken) {
    return repository.getCourse(firstToken, secondToken);
  }
}