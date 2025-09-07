import 'package:get/get.dart';

class BillsController extends GetxController {
  // Reactive list of all bills
  var allBills = <String>[
    'فاتورة مبيعات رقم 1234',
    'فاتورة مبيعات رقم 1235',
    'فاتورة مبيعات رقم 1236',
    'فاتورة مبيعات رقم 1237',
    'فاتورة مبيعات رقم 1238',
    'فاتورة مبيعات رقم 1239',
    'فاتورة مبيعات رقم 1240',
    'فاتورة مبيعات رقم 1241',
    'فاتورة مبيعات رقم 1242',
    'فاتورة مبيعات رقم 1243',
    'فاتورة مبيعات رقم 1244',
  ].obs;

  // Reactive max visible cards count
  var maxVisible = 10.obs;

  // Computed property for visible bills
  List<String> get visibleBills => allBills.take(maxVisible.value).toList();

  // Method to update max visible cards
  void updateMaxVisible(int count) {
    maxVisible.value = count;
  }
}
