import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FourTabsController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  var selectedIndex = 0.obs;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      selectedIndex.value = tabController.index;
    });
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
