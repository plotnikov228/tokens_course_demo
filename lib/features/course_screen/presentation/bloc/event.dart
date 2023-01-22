abstract class CourseEvent {}

class SetupCourseEvent extends CourseEvent {
  final String firstToken;
  final String secondToken;

  SetupCourseEvent(this.firstToken, this.secondToken);
}