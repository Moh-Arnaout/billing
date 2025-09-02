import 'package:billing/FourTables/Finished/finishedtable.dart';
import 'package:billing/FourTables/New/newtable.dart';
import 'package:billing/FourTables/Pending/pending_table.dart';
import 'package:billing/FourTables/Shortcomings/shortcomingstable.dart';
import 'package:billing/FourTables/Tabs/tab_item.dart';
import 'package:billing/alldetailspage2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class Fourtabs extends StatefulWidget {
  final GlobalKey<PendingTableState>? pendingTableKey;
  final GlobalKey<FinishedtableState>? finishedTableKey;
  final GlobalKey<ShortcomingsState>? shortcomingsKey;
  final GlobalKey<NewtableState>? newtableKey;

  const Fourtabs({
    super.key,
    this.pendingTableKey,
    this.finishedTableKey,
    this.shortcomingsKey,
    this.newtableKey,
  });

  @override
  State<Fourtabs> createState() => _FourtabsState();
}

class _FourtabsState extends State<Fourtabs> with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      if (mounted) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.removeListener(() {});
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
          child: Newtable(key: widget.newtableKey, initialValue: false),
        );
      case 1:
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
          child: Center(
            child: Center(
              child: Finishedtable(
                key: widget.finishedTableKey,
                initialValue: false,
              ),
            ),
          ),
        );
      case 2:
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
          child: Center(
            child: Center(
              child: Shortcomings(
                key: widget.shortcomingsKey,
                initialValue: false,
              ),
            ),
          ),
        );
      case 3:
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 12),
          child: Center(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => Alldetailspage2());
                },
                child: PendingTable(
                  key: widget.pendingTableKey,
                  initialValue: false,
                ),
              ),
            ),
          ),
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: TabBar(
                  controller: _tabController,
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
            duration: Duration(milliseconds: 300),
            child: _buildTabContent(_selectedIndex),
          ),
        ],
      ),
    );
  }
}
