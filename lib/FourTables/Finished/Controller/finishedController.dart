import 'package:get/get.dart';

class Finishedcontroller extends GetxController {
  // Reactive list of table rows
  RxList<TableRowData> tableRows = <TableRowData>[].obs;

  // Reactive list of visible columns
  RxList<String> visibleColumns = <String>[].obs;

  // Sorting order reactive flag
  RxBool isAscending = true.obs;

  @override
  void onInit() {
    super.onInit();

    // Initialize visible columns (all visible by default)
    visibleColumns.assignAll([
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
    ]);

    // Initialize table rows with independent reactive checkbox states
    tableRows.assignAll([
      TableRowData(
        clientName: 'شركة الشروق للطباعة والتغليف 1',
        testStatus: 'تم الفحص',
        programmingDepartment: 'Access',
        responsibleProgrammer: 'محمد أحمد',
        expectedDeliveryDate: '2025-09-01',
        generalNotes: 'تم أخذ نسخة احتياطية',
        testDate: '2025-08-20',
        clientDeliveryStatus: 'تم الفحص',
        actualDeliveryDate: '2025-08-25',
        scanValue: false,
        emailValue: false,
        crmValue: false,
        subscriptionValue: '1000',
        modificationsValue: '256.4',
        total: '1200',
        invoiceValue: '1200',
        invoiceNumber: 'INV-1002',
        invoiceStatus: 'لم تصدر',
        isFree: false,
        programmerIncentive: '100',
        invoiceNotes: 'ملاحظات الفاتورة',
      ),
      TableRowData(
        clientName: 'شركة الشروق للطباعة والتغليف 2',
        testStatus: 'تم الفحص',
        programmingDepartment: 'Access',
        responsibleProgrammer: 'محمد',
        expectedDeliveryDate: '2025-08-15',
        generalNotes: 'ملاحظات عامة',
        testDate: '2025-08-20',
        clientDeliveryStatus: 'تم الفحص',
        actualDeliveryDate: '2025-08-25',
        scanValue: false,
        emailValue: false,
        crmValue: false,
        subscriptionValue: '1000',
        modificationsValue: '256.4',
        total: '1200',
        invoiceValue: '1200',
        invoiceNumber: 'INV-1003',
        invoiceStatus: 'لم تصدر',
        isFree: false,
        programmerIncentive: '100',
        invoiceNotes: 'ملاحظات الفاتورة',
      ),
      TableRowData(
        clientName: 'عميل 3',
        testStatus: 'تم الفحص',
        programmingDepartment: 'Access',
        responsibleProgrammer: 'خالد',
        expectedDeliveryDate: '2025-10-01',
        generalNotes: 'ملاحظات عامة',
        testDate: '2025-08-20',
        clientDeliveryStatus: 'تم الفحص',
        actualDeliveryDate: '2025-08-25',
        scanValue: false,
        emailValue: false,
        crmValue: false,
        subscriptionValue: '1000',
        modificationsValue: '256.4',
        total: '1200',
        invoiceValue: '1200',
        invoiceNumber: 'INV-1004',
        invoiceStatus: 'لم تصدر',
        isFree: false,
        programmerIncentive: '100',
        invoiceNotes: 'ملاحظات الفاتورة',
      ),
    ]);
  }

  // Update visible columns reactively
  void updateVisibleColumns(List<String> columns) {
    visibleColumns.assignAll(columns);
  }

  // Sort rows by 'expectedDeliveryDate' reactively
  void sortByDeliveryDate() {
    if (isAscending.value) {
      tableRows.sort(
        (a, b) => DateTime.parse(
          a.expectedDeliveryDate,
        ).compareTo(DateTime.parse(b.expectedDeliveryDate)),
      );
    } else {
      tableRows.sort(
        (a, b) => DateTime.parse(
          b.expectedDeliveryDate,
        ).compareTo(DateTime.parse(a.expectedDeliveryDate)),
      );
    }
    isAscending.value = !isAscending.value;
  }
}

// Data model where checkboxes are reactive RxBool
class TableRowData {
  String clientName;
  String testStatus;
  String programmingDepartment;
  String responsibleProgrammer;
  String expectedDeliveryDate;
  String generalNotes;
  String testDate;
  String clientDeliveryStatus;
  String actualDeliveryDate;

  RxBool scanValue;
  RxBool emailValue;
  RxBool crmValue;

  String subscriptionValue;
  String modificationsValue;
  String total;
  String invoiceValue;
  String invoiceNumber;
  String invoiceStatus;

  RxBool isFree;

  String programmerIncentive;
  String invoiceNotes;

  TableRowData({
    required this.clientName,
    required this.testStatus,
    required this.programmingDepartment,
    required this.responsibleProgrammer,
    required this.expectedDeliveryDate,
    required this.generalNotes,
    required this.testDate,
    required this.clientDeliveryStatus,
    required this.actualDeliveryDate,
    required bool scanValue,
    required bool emailValue,
    required bool crmValue,
    required this.subscriptionValue,
    required this.modificationsValue,
    required this.total,
    required this.invoiceValue,
    required this.invoiceNumber,
    required this.invoiceStatus,
    required bool isFree,
    required this.programmerIncentive,
    required this.invoiceNotes,
  }) : scanValue = scanValue.obs,
       emailValue = emailValue.obs,
       crmValue = crmValue.obs,
       isFree = isFree.obs;
}
