import 'package:flutter/material.dart';
import 'package:workiomtest/core/constant/color.dart';

class TextFiled extends StatelessWidget {
  final String text;
  final String hint;
  final IconData icon;
  final IconData? seffixicon;
  final type;
  final String? Function(String?) valid;
  final TextEditingController? mycontroller;

  final bool? obscureText;
  final void Function()? onTapIcon;
  final void Function(String)? onChanged;

  const TextFiled({
    super.key,
    required this.text,
    required this.hint,
    required this.icon,
    this.seffixicon,
    required this.type,
    this.obscureText,
    this.onTapIcon,
    this.onChanged, required this.valid,
    required this.mycontroller,
  });

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
            controller: mycontroller,
            validator: valid,
            onChanged: onChanged,
            obscureText:
                obscureText == null || obscureText == false ? false : true,
            keyboardType: type,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  const TextStyle(color: AppColor.textcolor, fontSize: 15),
              icon: Icon(
                icon,
                color: AppColor.iconscolor2,
              ),
              suffixIcon: InkWell(
                onTap: onTapIcon,
                child: Icon(
                  seffixicon,
                  color: AppColor.iconscolor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
