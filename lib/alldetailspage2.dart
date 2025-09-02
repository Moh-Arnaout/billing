import 'package:billing/Details/Billingspart/billspage.dart';
import 'package:billing/Details/CRMpart/uploadcard.dart';
import 'package:billing/Details/Detailspart.dart/Row1.dart';
import 'package:billing/Details/Detailspart.dart/Row10.dart';
import 'package:billing/Details/Detailspart.dart/Row2.dart';
import 'package:billing/Details/Detailspart.dart/Row3.dart';
import 'package:billing/Details/Detailspart.dart/Row4.dart';
import 'package:billing/Details/Detailspart.dart/Row5.dart';
import 'package:billing/Details/Detailspart.dart/Row6.dart';
import 'package:billing/Details/Detailspart.dart/Row7.dart';
import 'package:billing/Details/Detailspart.dart/Row8.dart';
import 'package:billing/Details/Detailspart.dart/Row9.dart';
import 'package:billing/Details/Offerpart/offerpage.dart';
import 'package:billing/Header/header.dart';
import 'package:billing/Header/subheader.dart';
import 'package:billing/Header/subheader2.dart';
import 'package:billing/Sidepanel/sidepanel.dart';
import 'package:billing/FourTables/Finished/finishedtable.dart';
import 'package:billing/FourTables/New/newtable.dart';
import 'package:billing/FourTables/Pending/pending_table.dart';
import 'package:billing/FourTables/Shortcomings/shortcomingstable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Alldetailspage2 extends StatefulWidget {
  const Alldetailspage2({super.key});

  @override
  State<Alldetailspage2> createState() => BillingpageState();
}

class BillingpageState extends State<Alldetailspage2> {
  bool isSidebarOpen = true;
  bool showTable = true;
  int counter = 0;
  bool showUploadCard = false;

  // Single key for the PendingTable
  final GlobalKey<PendingTableState> pendingTableKey =
      GlobalKey<PendingTableState>();
  final GlobalKey<FinishedtableState> finishedTableKey =
      GlobalKey<FinishedtableState>();
  final GlobalKey<NewtableState> newTableKey = GlobalKey<NewtableState>();
  final GlobalKey<ShortcomingsState> shortcomingsKey =
      GlobalKey<ShortcomingsState>();

  List<String> _visibleColumns = [];

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void toggleSidebar() {
    setState(() {
      isSidebarOpen = !isSidebarOpen;
    });
  }

  void handleDemoChanged(bool isYes) {
    setState(() {
      showUploadCard = isYes;
    });
  }

  void _handleColumnsChanged(List<String> columns) {
    setState(() {
      _visibleColumns = columns;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      child: Column(
                        children: [
                          Header(isSidebarOpen: isSidebarOpen),
                          SizedBox(height: 37),
                          Subheader(counter: counter),
                          SizedBox(height: 32),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    Billspage(),
                                    SizedBox(height: 20),
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
                                        SizedBox(height: 16),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Row1(),
                                        ),
                                        SizedBox(height: 16),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Row2(),
                                        ),
                                        SizedBox(height: 16),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Row3(),
                                        ),
                                        SizedBox(height: 16),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Row4(),
                                        ),
                                        SizedBox(height: 16),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Row5(),
                                        ),
                                        SizedBox(height: 16),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Row6(),
                                        ),
                                        SizedBox(height: 16),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Row7(),
                                        ),
                                        SizedBox(height: 16),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Row8(),
                                        ),
                                        SizedBox(height: 16),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Row9(),
                                        ),
                                        SizedBox(height: 22),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Row10(),
                                        ),
                                        SizedBox(height: 16),
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
                                                textAlign: TextAlign.end,
                                                'CRM رفع الملفات على ',
                                                style: GoogleFonts.cairo(
                                                  color: Color(0xFF1E7CB4),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        /////////////////////////////////////////////////////////////////////////////////////
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
                                        SizedBox(height: 16),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 32,
                                            right: 12,
                                          ),
                                          child: Uploadcard(),
                                        ),
                                        /////////////////////////////////////////////////////////////////////////////////
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
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: isSidebarOpen ? sidebarWidth : 0,
              height: screenHeight,
              child: isSidebarOpen
                  ? Sidepanel(onToggle: toggleSidebar)
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
