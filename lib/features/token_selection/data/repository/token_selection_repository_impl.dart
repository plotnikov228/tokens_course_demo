import 'package:test_pancakeswap_app/features/token_selection/data/data_sources/data_source.dart';
import 'package:test_pancakeswap_app/features/token_selection/domain/entities/token.dart';
import 'package:test_pancakeswap_app/features/token_selection/domain/repositories/token_selection_repository.dart';

class TokenSelectionRepositoryImpl extends TokenSelectionRepository {
  final dataSource = TokenSelectionDataSource();
  @override
  Future<List<Token>> getTokenList() async {
    return dataSource.tokenList;
  }

}