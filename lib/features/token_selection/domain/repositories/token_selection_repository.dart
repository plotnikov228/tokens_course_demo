import 'package:test_pancakeswap_app/features/token_selection/domain/entities/token.dart';

abstract class TokenSelectionRepository {
  Future<List<Token>> getTokenList();
}