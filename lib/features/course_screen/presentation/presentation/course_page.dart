import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pancakeswap_app/features/course_screen/presentation/bloc/bloc.dart';
import 'package:test_pancakeswap_app/features/course_screen/presentation/bloc/event.dart';
import 'package:test_pancakeswap_app/features/course_screen/presentation/bloc/state.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tokens = ModalRoute.of(context)!.settings.arguments as List<String>;
    return Scaffold(
      body: BlocProvider(
          create: (context) => CourseScreenBloc(LoadingCourseScreenState())
            ..add(SetupCourseEvent(tokens.first, tokens.last)),
          child: BlocBuilder<CourseScreenBloc, CourseScreenState>(
            builder: (context, state) {
              if (state is InitialCourseScreenState) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Stack(

                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 32),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back,size: 32,),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                  '${state.course.time.day}.${state.course.time.month}.${state.course.time.year}', style: TextStyle(fontSize: 18),),
                            ),
                          ),


                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 70,
                                child: Column(
                                  children: [
                                    Text(
                                      tokens.first,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 24),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Center(
                                        child: Text('1'),
                                      ),
                                    )
                                  ],
                                )),
                            const Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Icon(Icons.arrow_downward_outlined),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width - 70,
                                child: Column(
                                  children: [
                                    Text(
                                      tokens.last,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 24),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Text(state.course.course.toString()),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      )
                    ]),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
