import 'package:billing/FourTables/Finished/View/finishedtable.dart';
import 'package:billing/FourTables/New/View/newtable.dart';
import 'package:billing/FourTables/Pending/View/pending_table.dart';
import 'package:billing/FourTables/Shortcomings/View/shortcomingstable.dart';
import 'package:billing/FourTables/Tabs/Controller/FourTabsController.dart';
import 'package:billing/FourTables/Tabs/View/tab_item.dart';
import 'package:billing/alldetailspage2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Fourtabs extends StatelessWidget {
  final Key? pendingTableKey;
  final Key? finishedTableKey;
  final Key? shortcomingsKey;
  final Key? newtableKey;

  const Fourtabs({
    super.key,
    this.pendingTableKey,
    this.finishedTableKey,
    this.shortcomingsKey,
    this.newtableKey,
  });

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          child: Newtable(key: newtableKey, initialValue: false),
        );
      case 1:
        return Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          child: Center(
            child: Center(
              child: Finishedtable(key: finishedTableKey, initialValue: false),
            ),
          ),
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          child: Center(
            child: Center(
              child: Shortcomings(key: shortcomingsKey, initialValue: false),
            ),
          ),
        );
      case 3:
        return Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 12),
          child: Center(
            child: Center(
              child: PendingTable(key: pendingTableKey, initialValue: false),
            ),
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final fourTabsController = Get.put(FourTabsController());
    return Obx(
      () => Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // TabBar container
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Center(
                  child: TabBar(
                    controller: fourTabsController.tabController,
                    dividerHeight: 1,
                    dividerColor: Color(0xFFDDEBF4),
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsetsGeometry.only(bottom: 4),
                    indicatorColor: Color(0xFF1E7CB4),
                    labelColor: Color(0xFF1E7CB4),
                    unselectedLabelColor: Color(0xFF505050),
                    labelStyle: GoogleFonts.cairo(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                    unselectedLabelStyle: GoogleFonts.cairo(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    tabs: const [
                      TabItem(title: 'عملاء فحص جديد'),
                      TabItem(title: 'عملاء تم الانتهاء'),
                      TabItem(title: 'عملاء - بوجود نواقص'),
                      TabItem(title: 'عملاء قيد التنفيذ'),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),

            AnimatedSwitcher(
              duration: Duration(milliseconds: 100),
              child: _buildTabContent(fourTabsController.selectedIndex.value),
            ),
          ],
        ),
      ),
    );
  }
}
