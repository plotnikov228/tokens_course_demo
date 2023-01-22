import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pancakeswap_app/features/course_screen/presentation/presentation/course_page.dart';
import 'package:test_pancakeswap_app/features/token_selection/domain/entities/token.dart';
import 'package:test_pancakeswap_app/features/token_selection/presentation/bloc/bloc.dart';
import 'package:test_pancakeswap_app/features/token_selection/presentation/bloc/event.dart';
import 'package:test_pancakeswap_app/features/token_selection/presentation/bloc/state.dart';

class TokenSelectionPage extends StatelessWidget {
  const TokenSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(create: (BuildContext context) => TokenSelectionBloc(LoadingTokenSelectionState())..add(SetupTokenSelectionEvent()),
      child:  BlocBuilder<TokenSelectionBloc, TokenSelectionState>(builder: (context, state) {
        final bloc = context.read<TokenSelectionBloc>();
      if (state is InitialTokenSelectionState) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 75,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(5)),
                      child: DropdownButton<String>(
                        underline: const SizedBox(),
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey,),
                        items: state.tokenList.map((e) => DropdownMenuItem(value: e.name,child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(e.name.toUpperCase()),
                        ),)).toList(),
                        onChanged: (value) {
                          bloc.add(SelectTokenEvent(1, Token(name: value.toString())));
                        },
                        value: state.tokenA.name,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Icon(Icons.arrow_downward_outlined),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 75,
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: BorderRadius.circular(5)),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey,),
                      items: state.tokenList.map((e) => DropdownMenuItem(value: e.name,child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(e.name.toUpperCase()),
                      ),)).toList(),
                      onChanged: (value) {
                        bloc.add(SelectTokenEvent(2, Token(name: value.toString())));
                      },
                      value: state.tokenB.name,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 75,
              height: 40,
              child: ElevatedButton(onPressed: () {
                if(state.tokenA.name != '' && state.tokenB.name != ''){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CoursePage(), settings: RouteSettings(
                    arguments: [state.tokenA.name.toUpperCase(), state.tokenB.name.toUpperCase()],
                  )));
                }
              }, child: const Text('WATCH')),
            )
          ],
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      }),),
    );
  }
}
