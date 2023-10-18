import 'package:flutter/material.dart';
import 'package:workiomtest/core/constant/color.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    final items = ['English', 'Turkish', 'Arabic'];
    String dropdownValue = "English";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 150),
      child: Row(
        children: [
          const Icon(
            Icons.language_outlined,
            size: 13,
            color: AppColor.textcolor,
          ),
          const SizedBox(width: 9.5),
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              items: items.map(buildMenuItem).toList(),
              onChanged: (value) => setState(() {
                dropdownValue = value!;
              }),
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
              fontSize: 12,
              fontFamily: 'Rubik-Light',
              fontWeight: FontWeight.w400),
        ),
      );
}
