
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:test_pancakeswap_app/features/course_screen/domain/entities/course.dart';

part 'course_screen_api.g.dart';

@RestApi(baseUrl: "")
abstract class CourseScreenApi {
  factory CourseScreenApi(Dio dio) = _CourseScreenApi;
  @GET('https://min-api.cryptocompare.com/data/price?fsym={firstToken}&tsyms={secondToken}')
  Future<Course> getCourse(@Path('firstToken') String firstToken, @Path('secondToken') String secondToken);
}