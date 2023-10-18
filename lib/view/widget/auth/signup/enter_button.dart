import 'package:flutter/material.dart';

class EnterButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color color;
  const EnterButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Opacity(
              opacity: 0,
              child: Icon(Icons.arrow_forward),
            ),
            Text(text,
                style: const TextStyle(
                    color: Colors.white, fontSize: 15, fontFamily: "Rubik")),
            Container(
              width: 24,
              height: 16,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(83, 253, 252, 252),
                  borderRadius: BorderRadius.circular(4)),
              child: Image.asset(
                'assets/images/enter.png',
                width: 24,
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
