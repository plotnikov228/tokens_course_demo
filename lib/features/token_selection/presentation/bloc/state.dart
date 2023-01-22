import 'package:test_pancakeswap_app/features/token_selection/domain/entities/token.dart';

abstract class TokenSelectionState {}

class LoadingTokenSelectionState extends TokenSelectionState {}
class InitialTokenSelectionState extends TokenSelectionState {
  final Token tokenA;
  final Token tokenB;
  final List<Token> tokenList;

  InitialTokenSelectionState(this.tokenList, this.tokenA, this.tokenB);

}