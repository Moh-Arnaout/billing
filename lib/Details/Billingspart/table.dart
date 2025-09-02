import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BillingsTable extends StatefulWidget {
  final bool initialValue;
  final Function(bool?)? onChanged;

  const BillingsTable({Key? key, this.initialValue = false, this.onChanged})
    : super(key: key);

  @override
  BillingsTableState createState() => BillingsTableState();
}

class BillingsTableState extends State<BillingsTable> {
  List<TableRowData> tableRows = [];

  @override
  void initState() {
    super.initState();

    tableRows.addAll([
      TableRowData(
        subjectname: 'Awael e-invoicing system cloud subscription',
        quantity: 1,
        price: 300.0,
        tax: 0.0, // 0%
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Table(
          textDirection: TextDirection.rtl, // Ensure RTL for the table itself
          columnWidths: const {
            0: FlexColumnWidth(3), // اسم المادة - wider
            1: FlexColumnWidth(1), // الكمية
            2: FlexColumnWidth(1), // السعر
            3: FlexColumnWidth(1), // الضريبة
            4: FlexColumnWidth(1), // السعر الإجمالي
          },
          children: [
            // Header row
            TableRow(
              decoration: const BoxDecoration(color: Color(0xFFE9F2F8)),
              children: [
                _buildHeaderCell('اسم المادة'),
                _buildHeaderCell('الكمية'),
                _buildHeaderCell('السعر'),
                _buildHeaderCell('الضريبة'),
                _buildHeaderCell('السعر الإجمالي'),
              ],
            ),
            // Data rows
            ...tableRows.map((row) {
              return TableRow(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                children: [
                  _buildDataCell(row.subjectname),
                  _buildDataCell(row.quantity.toString()),
                  _buildDataCell(row.price.toStringAsFixed(2)),
                  _buildDataCell('${row.tax.toStringAsFixed(1)}%'),
                  _buildDataCell(row.total.toStringAsFixed(2)),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String title) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      alignment: Alignment.centerRight, // Right align for RTL
      child: Text(
        title,
        style: GoogleFonts.cairo(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: const Color(0xFF505050),
        ),
        textAlign: TextAlign.right,
      ),
    );
  }

  Widget _buildDataCell(String text) {
    return Container(
      constraints: const BoxConstraints(minHeight: 66),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      alignment: Alignment.centerRight, // Right align for RTL
      child: Text(
        text,
        style: GoogleFonts.cairo(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF505050),
        ),
        textAlign: TextAlign.right,
        softWrap: true,
      ),
    );
  }
}

class TableRowData {
  String subjectname;
  int quantity;
  double price;
  double tax;

  TableRowData({
    required this.subjectname,
    required this.quantity,
    required this.price,
    required this.tax,
  });

  double get total => (quantity * price) * (1 + tax);
}
