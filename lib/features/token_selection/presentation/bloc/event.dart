import 'package:test_pancakeswap_app/features/token_selection/domain/entities/token.dart';

abstract class TokenSelectionEvent {}

class SetupTokenSelectionEvent extends TokenSelectionEvent {}
class SelectTokenEvent extends TokenSelectionEvent {
  final int tokenPlace;
  final Token token;
  SelectTokenEvent(this.tokenPlace, this.token);
}