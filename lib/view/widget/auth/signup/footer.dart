import 'package:flutter/material.dart';
import 'package:workiomtest/core/constant/color.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Stay organized with",
          style: TextStyle(
              fontFamily: "Rubik-Light",
              color: AppColor.textcolor,
              fontSize: 15),
        ),
        const SizedBox(width: 11.87),
        Image.asset(
          'assets/images/logo.png',
          width: 23.25,
          height: 15.5,
        ),
        const SizedBox(width: 7.77),
        const Text(
          "workiom",
          style: TextStyle(
              color: AppColor.textcolor2, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
