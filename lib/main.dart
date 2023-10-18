import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workiomtest/binding.dart';
import 'package:workiomtest/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialBinding: MyBinding(),
    );
  }
}
