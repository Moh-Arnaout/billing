import 'package:billing/Details/Billingspart/View/billspage.dart';
import 'package:billing/Details/CRMpart/View/uploadcard.dart';
import 'package:billing/Details/Detailspart.dart/View/Row1.dart';
import 'package:billing/Details/Detailspart.dart/View/Row10.dart';
import 'package:billing/Details/Detailspart.dart/View/Row2.dart';
import 'package:billing/Details/Detailspart.dart/View/Row3.dart';
import 'package:billing/Details/Detailspart.dart/View/Row4.dart';
import 'package:billing/Details/Detailspart.dart/View/Row5.dart';
import 'package:billing/Details/Detailspart.dart/View/Row6.dart';
import 'package:billing/Details/Detailspart.dart/View/Row7.dart';
import 'package:billing/Details/Detailspart.dart/View/Row8.dart';
import 'package:billing/Details/Detailspart.dart/View/Row9.dart';
import 'package:billing/Details/Offerpart/View/offerpage.dart';
import 'package:billing/Header/header.dart';
import 'package:billing/Header/subheader.dart';
import 'package:billing/Header/subheader2.dart';
import 'package:billing/Sidepanel/sidepanel.dart';
import 'package:billing/FourTables/Finished/View/finishedtable.dart';
import 'package:billing/FourTables/New/View/newtable.dart';
import 'package:billing/FourTables/Pending/View/pending_table.dart';
import 'package:billing/FourTables/Shortcomings/View/shortcomingstable.dart';
import 'package:billing/combinedControllers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';

class Alldetailspage2 extends StatelessWidget {
  const Alldetailspage2({super.key});

  @override
  Widget build(BuildContext context) {
    // Use Get.find since controller is already created in Billingpage
    final BillingController controller = Get.find<BillingController>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final sidebarWidth = screenWidth / 5;

    return Scaffold(
      body: Container(
        color: Color(0xFFF9F8FD),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: screenHeight,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: screenWidth),
                      child: Column(
                        children: [
                          Obx(
                            () => Header(
                              isSidebarOpen: controller.isSidebarOpen.value,
                            ),
                          ),
                          const SizedBox(height: 37),
                          Obx(
                            () => Subheader(counter: controller.counter.value),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Billspage(),
                                    const SizedBox(height: 20),
                                    Offerpage(),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        // Client Details Header
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 12,
                                            right: 12,
                                            top: 12,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'تفاصيل العميل',
                                                style: GoogleFonts.cairo(
                                                  color: Color(0xFF1E7CB4),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Divider(
                                            height: 32,
                                            thickness: 2,
                                            color: Color(0xFF1E7CB4),
                                          ),
                                        ),
                                        const SizedBox(height: 16),

                                        // All Row widgets
                                        ...List.generate(10, (index) {
                                          final rowWidgets = [
                                            Row1(),
                                            Row2(),
                                            Row3(),
                                            Row4(),
                                            Row5(),
                                            Row6(),
                                            Row7(),
                                            Row8(),
                                            Row9(),
                                            Row10(),
                                          ];
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                              left: 32,
                                              right: 12,
                                              bottom: 16,
                                            ),
                                            child: rowWidgets[index],
                                          );
                                        }),

                                        const SizedBox(height: 6),

                                        // CRM Header
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                            top: 12,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'CRM رفع الملفات على ',
                                                textAlign: TextAlign.end,
                                                style: GoogleFonts.cairo(
                                                  color: Color(0xFF1E7CB4),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Divider(
                                            height: 32,
                                            thickness: 2,
                                            color: Color(0xFF1E7CB4),
                                          ),
                                        ),

                                        const SizedBox(height: 16),

                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Uploadcard(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: controller.isSidebarOpen.value ? sidebarWidth : 0,
                height: screenHeight,
                child: controller.isSidebarOpen.value
                    ? Sidepanel(onToggle: controller.toggleSidebar)
                    : SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
