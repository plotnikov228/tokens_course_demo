import 'package:test_pancakeswap_app/features/token_selection/domain/entities/token.dart';
import 'package:test_pancakeswap_app/features/token_selection/domain/repositories/token_selection_repository.dart';

class GetTokenList {
  final TokenSelectionRepository repository;

  GetTokenList(this.repository);

    Future<List<Token>> getTokenList () async {
      return repository.getTokenList();
    }
}