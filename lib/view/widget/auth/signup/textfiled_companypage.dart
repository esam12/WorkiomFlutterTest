import 'package:flutter/material.dart';
import 'package:workiomtest/core/constant/color.dart';

class TextFiledWorkSpace extends StatelessWidget {
  final String text;
  final String hint;
  final IconData icon;
  String? suffixtext;
  final TextEditingController? mycontroller;
  final type;
  final String? Function(String?) valid;

  TextFiledWorkSpace(
      {super.key,
      required this.hint,
      required this.icon,
      this.type,
      required this.text,
      this.suffixtext,
      required this.valid,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(text,
              style: const TextStyle(
                  fontFamily: "Rubik-Light",
                  color: AppColor.workemailcolor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400)),
        ),
        const SizedBox(height: 15),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            validator: valid,
            controller: mycontroller,
            keyboardType: type,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  const TextStyle(color: AppColor.textcolor, fontSize: 15),
              icon: Icon(
                icon,
                color: AppColor.iconscolor2,
              ),
              suffixText: suffixtext,
              suffixStyle: const TextStyle(
                color: AppColor.iconscolor,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
