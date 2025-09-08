import 'package:billing/Details/CRMpart/View/uploading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Uploadcard extends StatelessWidget {
  const Uploadcard({super.key, this.onFilePicked});
  final VoidCallback? onFilePicked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(children: [Uploading()]),
    );
  }
}
