import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BillingController extends GetxController {
  var isSidebarOpen = true.obs;
  var showTable = true.obs;
  var counter = 0.obs;
  var showUploadCard = false.obs;

  // Keys for tables
  final pendingTableKey = ValueKey('pending_table');
  final finishedTableKey = ValueKey('finished_table');
  final newTableKey = ValueKey('new_table');
  final shortcomingsKey = ValueKey('shortcomings_table');

  var visibleColumns = <String>[].obs;

  void incrementCounter() {
    counter.value++;
  }

  void toggleSidebar() {
    isSidebarOpen.value = !isSidebarOpen.value;
  }

  void handleDemoChanged(bool isYes) {
    showUploadCard.value = isYes;
  }

  void updateVisibleColumns(List<String> columns) {
    visibleColumns.value = columns;
  }
}
