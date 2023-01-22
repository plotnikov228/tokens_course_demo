import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pancakeswap_app/features/token_selection/data/repository/token_selection_repository_impl.dart';
import 'package:test_pancakeswap_app/features/token_selection/domain/entities/token.dart';
import 'package:test_pancakeswap_app/features/token_selection/domain/repositories/token_selection_repository.dart';
import 'package:test_pancakeswap_app/features/token_selection/domain/usecases/get_token_list.dart';
import 'package:test_pancakeswap_app/features/token_selection/presentation/bloc/event.dart';
import 'package:test_pancakeswap_app/features/token_selection/presentation/bloc/state.dart';

class TokenSelectionBloc extends Bloc<TokenSelectionEvent, TokenSelectionState> {
  TokenSelectionBloc(super.initialState){
    var repository = TokenSelectionRepositoryImpl();
    late List<Token> tokenList;
    var tokenA = Token(name: '');
    var tokenB = Token(name: '');

  on<SetupTokenSelectionEvent>((event, emit) async {
    tokenList = await GetTokenList(repository).getTokenList();
    tokenA = tokenList.first;
    tokenB = tokenList.last;
    emit(InitialTokenSelectionState(tokenList, tokenA, tokenB));
  });

  on<SelectTokenEvent>((event, emit) async {
    if (event.tokenPlace == 1) {
      tokenA = event.token;
    } else {
      tokenB = event.token;
    }
    emit(InitialTokenSelectionState(tokenList, tokenA, tokenB));
  });

  }
}