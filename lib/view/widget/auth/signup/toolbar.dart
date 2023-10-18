import 'package:flutter/material.dart';
import 'package:workiomtest/core/constant/color.dart';

class Toolbar extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Toolbar({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.primarycolor,
            ),
            onPressed: onPressed),
        Text(
          text,
          style: const TextStyle(
            color: AppColor.primarycolor,
            fontFamily: 'Rubik-Light',
          ),
        )
      ],
    );
  }
}
