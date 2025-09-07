import 'package:get/get.dart';

class ColumnFilterController extends GetxController {
  RxList<String> selectedColumns = <String>[].obs;

  final List<String> availableColumns = [
    'اسم العميل',
    'حالة الفحص',
    'قسم البرمجة',
    'المبرمج المسؤول',
    'تاريخ التسليم المتوقع',
    'ملاحظات عامة',
    'تاريخ الفحص',
    'حالة تسليم العميل',
    'تاريخ التسليم الفعلي',
    'Scan',
    'إرسال إيميل ل رنا',
    'رفع الملفات على CRM',
    'قيمة الاشتراك',
    'قيمة التعديلات',
    'المجموع',
    'قيمة الفاتورة',
    'رقم الفاتورة',
    'حالة الفاتورة',
    'مجانية',
    'حافز مبرمج',
    'ملاحظات الفاتورة',
  ];

  void initSelectedColumns(List<String> initialSelectedColumns) {
    if (initialSelectedColumns.isNotEmpty) {
      selectedColumns.assignAll(initialSelectedColumns);
    } else {
      selectedColumns.assignAll(availableColumns);
    }
  }

  void selectAll() => selectedColumns.assignAll(availableColumns);

  void clearAll() => selectedColumns.clear();

  void toggleColumn(String column) {
    selectedColumns.contains(column)
        ? selectedColumns.remove(column)
        : selectedColumns.add(column);
  }
}
