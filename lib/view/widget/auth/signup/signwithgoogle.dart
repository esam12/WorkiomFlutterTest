import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:workiomtest/core/constant/color.dart';

class SignWithGoogle extends StatelessWidget {
  const SignWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    final RoundedLoadingButtonController googleController =
        RoundedLoadingButtonController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RoundedLoadingButton(
        onPressed: () {
          
          // handleGoogleSignIn();
        },
        controller: googleController,
        width: double.maxFinite,
        height: 50,
        elevation: 0,
        borderRadius: 16,
        color: AppColor.googlebackground,
        child: Wrap(
          children: [
            Image.asset(
              'assets/images/search.png',
              width: 16,
              height: 16,
            ),
            const SizedBox(
              width: 15,
            ),
            const Text("Continue with Google",
                style: TextStyle(
                    color: Colors.black, fontSize: 15, fontFamily: "Rubik")),
          ],
        ),
      ),
    );
  }
}
