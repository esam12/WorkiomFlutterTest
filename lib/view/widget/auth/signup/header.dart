import 'package:flutter/material.dart';
import 'package:workiomtest/core/constant/color.dart';

class Header extends StatelessWidget {
  final String text;
  const Header({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: const TextStyle(
                fontFamily: "Rubik-Medium",
                fontWeight: FontWeight.w700,
                fontSize: 24),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Let's start an amazing journey!",
                style: TextStyle(
                    fontFamily: "Rubik-Light",
                    fontSize: 17,
                    //letterSpacing: 0.1,
                    color: AppColor.textcolor),
              ),
            ),
            Image.asset(
              "assets/images/hi.png",
              width: 22,
              height: 22,
            ),
          ],
        ),
      ],
    );
  }
}
