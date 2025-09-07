import 'package:billing/FourTables/Finished/Controller/finishedController.dart';
import 'package:billing/FourTables/New/Controller/newController.dart';
import 'package:billing/FourTables/Pending/Controller/PendingController.dart';
import 'package:billing/FourTables/Shortcomings/Controller/ShortcomingsController.dart';
import 'package:billing/billingpage.dart';
import 'package:billing/scroll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  Get.put(Newcontroller());
  Get.put(Pendingcontroller());
  Get.put(Finishedcontroller());
  Get.put(ShortcomingsController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Billingpage(), //Alldetailspage2
    );
  }
}
