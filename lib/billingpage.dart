import 'package:billing/FourTables/Finished/View/finishedtable.dart';
import 'package:billing/FourTables/New/View/newtable.dart';
import 'package:billing/FourTables/Pending/View/pending_table.dart';
import 'package:billing/FourTables/Shortcomings/View/shortcomingstable.dart';
import 'package:billing/FourTables/Tabs/View/incen_comm.dart';
import 'package:billing/Header/header.dart';
import 'package:billing/Header/subheader.dart';
import 'package:billing/Header/subheader2.dart';
import 'package:billing/Sidepanel/sidepanel.dart';
import 'package:flutter/material.dart';

class Billingpage extends StatefulWidget {
  const Billingpage({super.key});

  @override
  State<Billingpage> createState() => BillingpageState();
}

class BillingpageState extends State<Billingpage> {
  bool isSidebarOpen = true;
  bool showTable = true;
  int counter = 0;
  bool showUploadCard = false;

  // Single key for the PendingTable
  Key? pendingTableKey;
  Key? finishedTableKey;
  Key? newTableKey;
  Key? shortcomingsKey;

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(isSidebarOpen: isSidebarOpen),
                        SizedBox(height: 37),
                        Subheader(counter: counter),
                        SizedBox(height: 32),
                        Subheader2(
                          onColumnsChanged: _handleColumnsChanged,
                          pendingTableKey: pendingTableKey,
                          finishedTableKey: finishedTableKey,
                          newTableKey: newTableKey,
                          shortcomingsKey: shortcomingsKey,
                        ),
                        SizedBox(height: 32),
                        Fourtabs(
                          pendingTableKey: pendingTableKey,
                          finishedTableKey: finishedTableKey,
                          newtableKey: newTableKey,
                          shortcomingsKey: shortcomingsKey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 100),
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
