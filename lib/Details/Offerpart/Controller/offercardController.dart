import 'package:get/get.dart';

class OffercardController extends GetxController {
  final RxMap<String, bool> expandedCards = <String, bool>{}.obs;

  void toggleExpanded(String cardId) {
    expandedCards[cardId] = !(expandedCards[cardId] ?? false);
  }

  bool isExpanded(String cardId) {
    return expandedCards[cardId] ?? false;
  }

  // Performance: Clear unused expanded states periodically
  void clearUnusedStates() {
    if (expandedCards.length > 20) {
      expandedCards.clear();
    }
  }
}
