import 'package:billing/FourTables/Tabs/View/incen_comm.dart';
import 'package:billing/Header/header.dart';
import 'package:billing/Header/subheader.dart';
import 'package:billing/Header/subheader2.dart';
import 'package:billing/Sidepanel/sidepanel.dart';
import 'package:billing/combinedControllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Billingpage extends StatelessWidget {
  const Billingpage({super.key});

  @override
  Widget build(BuildContext context) {
    final BillingController controller = Get.put(BillingController());
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final sidebarWidth = screenWidth / 5;

    return Scaffold(
      body: Container(
        color: Color(0xFFF9F8FD),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: screenHeight,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Header(
                            isSidebarOpen: controller.isSidebarOpen.value,
                          ),
                        ),
                        SizedBox(height: 37),
                        Obx(() => Subheader(counter: controller.counter.value)),
                        SizedBox(height: 32),
                        Subheader2(
                          onColumnsChanged: controller.updateVisibleColumns,
                          pendingTableKey: controller.pendingTableKey,
                          finishedTableKey: controller.finishedTableKey,
                          newTableKey: controller.newTableKey,
                          shortcomingsKey: controller.shortcomingsKey,
                        ),
                        SizedBox(height: 32),
                        Fourtabs(
                          pendingTableKey: controller.pendingTableKey,
                          finishedTableKey: controller.finishedTableKey,
                          newtableKey: controller.newTableKey,
                          shortcomingsKey: controller.shortcomingsKey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedContainer(
                duration: Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                width: controller.isSidebarOpen.value ? sidebarWidth : 0,
                height: screenHeight,
                child: controller.isSidebarOpen.value
                    ? Sidepanel(onToggle: controller.toggleSidebar)
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
