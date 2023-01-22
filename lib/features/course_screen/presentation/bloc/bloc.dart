import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pancakeswap_app/features/course_screen/data/repositories/course_screen_repository_impl.dart';
import 'package:test_pancakeswap_app/features/course_screen/domain/usecases/get_course.dart';
import 'package:test_pancakeswap_app/features/course_screen/presentation/bloc/event.dart';
import 'package:test_pancakeswap_app/features/course_screen/presentation/bloc/state.dart';

class CourseScreenBloc extends Bloc<CourseEvent, CourseScreenState>{
  CourseScreenBloc(super.initialState){
    final repository = CourseScreenRepositoryImpl();

    on<SetupCourseEvent>((event,emit) async{
      try {
        final course = await GetCourse(repository).getCourse(event.firstToken, event.secondToken);
        emit(InitialCourseScreenState(course));
      } catch(_) {
        print(_);
      }
    });
  }
}